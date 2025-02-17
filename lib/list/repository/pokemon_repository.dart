import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/models/repository_error.dart';
import 'package:poke_facts/list/model/pokemon.dart';

abstract class PokemonRepository {
  Stream<List<Pokemon>> observePokemons(String name);
  TaskEither<RepositoryError, Unit> refresh();
}
