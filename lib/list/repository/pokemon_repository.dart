// pokemon_repository.dart
import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/models/repository_error.dart';
import 'package:poke_facts/list/model/pokemon.dart';

abstract class PokemonRepository {
  TaskEither<RepositoryError, Pokemon> getPokemon(String name);
}
