import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/provider/date_provider.dart';
import 'package:poke_facts/list/repository/pokemon_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyncPokemons {
  static const _lastSyncKey = 'lastSync';
  static const _allowedFetchInterval = 3; // days

  final PokemonRepository pokemonRepository;
  final SharedPreferences prefs;
  final DateProvider dateProvider;

  SyncPokemons({
    required this.pokemonRepository,
    required this.prefs,
    required this.dateProvider,
  });

  TaskEither<PokemonSyncFailure, Unit> call() => TaskEither(() => _call());

  Future<Either<PokemonSyncFailure, Unit>> _call() async {
    final shouldSync = await _shouldSync();
    if (!shouldSync) {
      return left(const SyncNotNeeded());
    }

    return await _syncWithBackoff(0, maxAttempts: 5);
  }

  Future<bool> _shouldSync() async {
    final lastSyncMillis = prefs.getInt(_lastSyncKey) ?? 0;
    final lastSync = DateTime.fromMillisecondsSinceEpoch(lastSyncMillis);
    final now = dateProvider.generate();
    if (now.difference(lastSync).inDays >= _allowedFetchInterval) {
      await prefs.setInt(_lastSyncKey, now.millisecondsSinceEpoch);
      return true;
    }
    return false;
  }

  Future<Either<PokemonSyncFailure, Unit>> _syncWithBackoff(
    int attempt, {
    int maxAttempts = 5,
  }) async {
    final result = await pokemonRepository.refresh().run();
    return await result.fold((failure) async {
      if (attempt < maxAttempts) {
        final baseDelay = 250;
        final delayMs = baseDelay * (1 << attempt);
        await Future.delayed(Duration(milliseconds: delayMs));
        return await _syncWithBackoff(attempt + 1, maxAttempts: maxAttempts);
      } else {
        return left(const SyncRetry());
      }
    }, (unit) async => right(unit));
  }
}

sealed class PokemonSyncFailure extends Equatable {
  const PokemonSyncFailure();

  @override
  List<Object?> get props => [];
}

final class SyncRetry extends PokemonSyncFailure {
  const SyncRetry();

  @override
  List<Object?> get props => [];
}

final class SyncNotNeeded extends PokemonSyncFailure {
  const SyncNotNeeded();

  @override
  List<Object?> get props => [];
}
