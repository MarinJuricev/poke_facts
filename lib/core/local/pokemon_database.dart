import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'pokemon_database.g.dart';

@DriftDatabase(
  include: {'pokemon_queries.drift'},
)
class PokemonDatabase extends _$PokemonDatabase {
  PokemonDatabase() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}
