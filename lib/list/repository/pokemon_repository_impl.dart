import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/local/local_service.dart';
import 'package:poke_facts/core/local/pokemon_database.dart';
import 'package:poke_facts/core/models/poke_type.dart';
import 'package:poke_facts/core/models/repository_error.dart';
import 'package:poke_facts/core/network/network_service.dart';
import 'package:poke_facts/list/model/pokemon.dart';

import 'pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final NetworkService networkService;
  final LocalService localService;

  PokemonRepositoryImpl({
    required this.networkService,
    required this.localService,
  });

  @override
  Stream<List<Pokemon>> observePokemons(String name) => localService
      .selectPokemonsByTerm(name)
      .map(
        (localPokemons) =>
            localPokemons
                .map(
                  (localPokemon) => Pokemon(
                    id: localPokemon.id.toString(),
                    name: localPokemon.name,
                    image: localPokemon.frontDefault,
                    height: localPokemon.height,
                    weight: localPokemon.weight,
                    types: _parseTypes(localPokemon.types),
                  ),
                )
                .toList(),
      );

  @override
  TaskEither<RepositoryError, Unit> refresh() => networkService
      .getPokemons()
      .map(
        (networkPokemonList) =>
            networkPokemonList
                .map(
                  (networkPokemon) => LocalPokemon(
                    id: networkPokemon.id,
                    baseExperience: 0,
                    name: networkPokemon.name,
                    height: networkPokemon.height,
                    weight: networkPokemon.weight,
                    types: networkPokemon.types
                        .map((networkType) => networkType.type.name)
                        .join(','),
                    frontDefault: networkPokemon.sprites.frontDefault,
                    frontShiny: networkPokemon.sprites.frontShiny,
                    backDefault: networkPokemon.sprites.backDefault,
                    backShiny: networkPokemon.sprites.backShiny,
                  ),
                )
                .toList(),
      )
      .map((result) => localService.insertPokemons(result))
      .map((result) => unit);

  List<PokeType> _parseTypes(String typesString) {
    return typesString
        .split(',')
        .map((str) => PokeType.values.firstWhere((t) => t.name == str))
        .toList();
  }
}
