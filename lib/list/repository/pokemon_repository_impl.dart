// pokemon_repository_impl.dart
import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/models/repository_error.dart';
import 'package:poke_facts/core/network/network_service.dart';
import 'package:poke_facts/list/model/pokemon.dart';

import 'pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final NetworkService networkService;

  PokemonRepositoryImpl({required this.networkService});

  @override
  TaskEither<RepositoryError, Pokemon> getPokemon(String name) {
    return networkService
        .getPokemon(name)
        .map((networkPokemon) => Pokemon(name: networkPokemon.name));
  }
}
