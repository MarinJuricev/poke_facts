import 'package:drift/drift.dart';

class PokemonsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get baseExperience => integer().named('base_experience')();
  IntColumn get height => integer()();
  IntColumn get weight => integer()();

  @override
  Set<Column> get primaryKey => {id};
}