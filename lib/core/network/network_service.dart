import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/models/repository_error.dart';
import 'package:poke_facts/list/model/network_pokemon.dart';

abstract class NetworkService {
  TaskEither<RepositoryError, List<NetworkPokemon>> getPokemons();
}
