import 'package:equatable/equatable.dart';

sealed class PokemonListFailure extends Equatable {
  const PokemonListFailure();
}

class MappedError extends PokemonListFailure {
  final String message;

  const MappedError({required this.message});

  @override
  List<Object?> get props => [message];
}
