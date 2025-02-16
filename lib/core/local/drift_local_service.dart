import 'package:drift/drift.dart';
import 'package:poke_facts/core/local/pokemon_database.dart';

import 'local_service.dart';

class DriftLocalService implements LocalService {
  final PokemonDatabase _db;

  DriftLocalService(this._db);

  @override
  Future<void> insertPokemons(List<LocalPokemon> pokemons) async {
    await _db.batch(
      (batch) {
        batch.customStatement(
          'INSERT OR REPLACE INTO local_pokemons (id, name, base_experience, height, weight) VALUES (?, ?, ?, ?, ?)',
          pokemons
              .map(
                (p) => [
                  Variable.withInt(p.id),
                  Variable.withString(p.name),
                  Variable.withInt(p.baseExperience),
                  Variable.withInt(p.height),
                  Variable.withInt(p.weight),
                ],
              )
              .toList(),
        );
      },
    );
  }

  @override
  Stream<List<LocalPokemon>> selectPokemonsByTerm(String searchTerm) {
    return _db.selectPokemonsByName(searchTerm).watch().map(
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
