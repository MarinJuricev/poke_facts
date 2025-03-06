import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/models/repository_error.dart';
import 'package:poke_facts/core/network/network_service.dart';
import 'package:poke_facts/list/model/network_pokemon.dart';

class DioNetworkService implements NetworkService {
  final Dio dio;
  CancelToken? _cancelToken;

  DioNetworkService({required this.dio});

  @override
  TaskEither<RepositoryError, List<NetworkPokemon>> getPokemons() {
    return _fetchAllPokemonsTask();
  }

  TaskEither<RepositoryError, List<NetworkPokemon>> _fetchAllPokemonsTask({
    int concurrency = 10,
  }) {
    return TaskEither.tryCatch(
      () async {
        _cancelToken?.cancel();
        _cancelToken = CancelToken();
        final response = await dio.get(
          // Fetch only the "original" pokemon, doing 1500+ API calls to have them is insanity
          'pokemon?limit=151',
          cancelToken: _cancelToken,
        );
        final summaries = response.data['results'] as List<dynamic>;
        return summaries;
      },
      (error, stackTrace) =>
          error is RepositoryError ? error : const UnknownRepositoryError(),
    ).flatMap((summaries) {
      return _fetchAllPokemonDetailsTask(summaries, concurrency: concurrency);
    });
  }

  TaskEither<RepositoryError, List<NetworkPokemon>> _fetchAllPokemonDetailsTask(
    List<dynamic> summaries, {
    int concurrency = 10,
  }) {
    return TaskEither.tryCatch(
      () async {
        final List<NetworkPokemon> results = [];
        final List<Future<void>> currentBatch = [];

        for (final summary in summaries) {
          final url = summary['url'] as String;

          final future = () async {
            final response = await dio.get(url);
            final detail = NetworkPokemon.fromJson(response.data);
            results.add(detail);
          }();
          currentBatch.add(future);

          if (currentBatch.length >= concurrency) {
            await Future.wait(currentBatch);
            currentBatch.clear();
          }
        }

        if (currentBatch.isNotEmpty) {
          await Future.wait(currentBatch);
        }
        return results;
      },
      (error, stackTrace) {
        print('Got stacktrace: $stackTrace');
        return error is RepositoryError
            ? error
            : const UnknownRepositoryError();
      },
    );
  }
}
