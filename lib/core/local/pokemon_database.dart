import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:poke_facts/core/local/pokemons_table.dart';

import 'local_pokemon.dart';

part 'pokemon_database.g.dart';

@DriftDatabase(tables: [PokemonsTable])
class AppDatabase extends _$AppDatabase {
  // Use NativeDatabase(File('db.sqlite')) for persistent storage
  AppDatabase() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;

  /// Fetch all local Pokémon.
  Future<List<LocalPokemon>> getAllLocalPokemons() async {
    final rows = await select(localPokemons).get();
    return rows
        .map((row) => LocalPokemon(
              id: row.id,
              name: row.name,
              baseExperience: row.baseExperience,
              height: row.height,
              weight: row.weight,
            ))
        .toList();
  }

// /// Upsert (insert/update) a list of local Pokémon.
// Future<void> upsertLocalPokemons(List<LocalPokemonsCompanion> pokemons) async {
//   await batch((batch) {
//     batch.insertAllOnConflictUpdate(localPokemons, pokemons);
//   });
// }
}
