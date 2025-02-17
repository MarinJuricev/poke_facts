import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/local/pokemon_database.dart';

abstract class LocalService {

  Future<Unit> insertPokemons(List<LocalPokemon> pokemons);

  Stream<List<LocalPokemon>> selectAllPokemons();

  Stream<List<LocalPokemon>> selectPokemonsByTerm(String searchTerm);
}