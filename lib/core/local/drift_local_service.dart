import 'package:drift/drift.dart';
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
          try {
            //   await _db.batch(
            //     (batch) {
            //       batch.customStatement(
            //         'INSERT OR REPLACE INTO local_pokemons (id, name, base_experience, height, weight) VALUES (?, ?, ?, ?, ?)',
            //         pokemons
            //             .map(
            //               (p) => [
            //                 Variable.withInt(p.id),
            //                 Variable.withString(p.name),
            //                 Variable.withInt(p.baseExperience),
            //                 Variable.withInt(p.height),
            //                 Variable.withInt(p.weight),
            //               ],
            //             )
            //             .toList(),
            //       );
            //     },
            //   );
            final result = await _db.insertPokemon(
              pokemon.id,
              pokemon.name,
              pokemon.baseExperience,
              pokemon.height,
              pokemon.weight,
            );
            print("Inserted ${pokemon.name} with result: $result");
            return result;
          } catch (e) {
            print("Error inserting ${pokemon.name}: $e");
            rethrow; // rethrow so that Future.wait fails if any insert fails
          }
        }),
      );
      await _debugPrintAllData();
      return unit;
    } catch (error, stacktrace) {
      print("Error during insertPokemons: $error\n$stacktrace");
      rethrow;
    }
  }

  @override
  Stream<List<LocalPokemon>> selectPokemonsByTerm(String searchTerm) {
    return _db.selectMainPokemonsByName(searchTerm).watch().map(
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
    // return _db.selectPokemonsByName(searchTerm).watch().map(
    //   (rows) {
    //     return rows
    //         .map(
    //           (row) => LocalPokemon(
    //             id: row.id,
    //             name: row.name,
    //             baseExperience: row.baseExperience,
    //             height: row.height,
    //             weight: row.weight,
    //           ),
    //         )
    //         .toList();
    //   },
    // );
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

  Future<void> _debugPrintAllData() async {
    final results = await _db.selectAllPokemons().get();
    final queryResult = await _db.selectMainPokemonsByName('%char%').get();
    final ftsResult = await _db.selectPokemonsByName('char*').get();
    print('Rows count: ${results.length}');
    for (final row in results) {
      print(row.id);
    }
  }
}
