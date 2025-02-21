import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/local/pokemon_database.dart';

import 'local_service.dart';

class DriftLocalService implements LocalService {
  final PokemonDatabase _db;

  DriftLocalService(this._db);

  @override
  Future<Unit> insertPokemons(List<LocalPokemon> pokemons) async {
    try {
      await Future.wait(
        pokemons.map((pokemon) async {
          await _db.insertPokemon(
            pokemon.id,
            pokemon.name,
            pokemon.baseExperience,
            pokemon.height,
            pokemon.weight,
          );
        }),
      );
      return unit;
    } catch (error, stacktrace) {
      debugPrint("Error during insertPokemons: $error\n$stacktrace");
      rethrow;
    }
  }

  @override
  Stream<List<LocalPokemon>> selectPokemonsByTerm(String searchTerm) {
    return _db.selectPokemonsByName('$searchTerm*').watch().map(
      (rows) {
        return rows
            .map(
              (row) => LocalPokemon(
                id: row.id,
                name: row.name,
                baseExperience: row.baseExperience,
                height: row.height,
                weight: row.weight,
              ),
            )
            .toList();
      },
    );
  }

  @override
  Stream<List<LocalPokemon>> selectAllPokemons() {
    return _db.selectAllPokemons().watch().map(
      (rows) {
        return rows
            .map(
              (row) => LocalPokemon(
                id: row.id,
                name: row.name,
                baseExperience: row.baseExperience,
                height: row.height,
                weight: row.weight,
              ),
            )
            .toList();
      },
    );
  }
}
