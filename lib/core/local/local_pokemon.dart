import 'package:drift/drift.dart';

import 'pokemons_table.dart';

class LocalPokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;

  LocalPokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
  });

  // PokemonsTableCompanion toCompanion() {
  //   return LocalPokemonsCompanion(
  //     id: Value(id),
  //     name: Value(name),
  //     baseExperience: Value(baseExperience),
  //     height: Value(height),
  //     weight: Value(weight),
  //   );
  // }
}
