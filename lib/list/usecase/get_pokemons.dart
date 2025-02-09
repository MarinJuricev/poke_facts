import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/models/repository_error.dart';
import 'package:poke_facts/list/model/pokemon.dart';
import 'package:poke_facts/list/model/pokemon_failure.dart';
import 'package:poke_facts/list/repository/pokemon_repository.dart';

class GetPokemons {
  final PokemonRepository repository;

  GetPokemons({required this.repository});

  TaskEither<PokemonListFailure, Pokemon> call(String name) {
    return repository.getPokemon(name).mapLeft(
      (repoError) {
        switch (repoError) {
          case CodeFailure():
            return MappedError(
              message: 'Failed with error ${repoError.statusCode}',
            );
          case UnknownRepositoryError():
            return MappedError(
              message: 'Unknown error occurred, please try again later',
            );
        }
      },
    );
  }
}
