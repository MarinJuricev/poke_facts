import 'package:poke_facts/core/local/drift_local_service.dart';
import 'package:poke_facts/core/local/local_service.dart';
import 'package:poke_facts/core/local/pokemon_database.dart';
import 'package:poke_facts/di.dart';

void loadLocalModule() {
  getIt.registerLazySingleton<PokemonDatabase>(
    () => PokemonDatabase(),
  );

  getIt.registerFactory<LocalService>(
    () => DriftLocalService(
      getIt<PokemonDatabase>(),
    ),
  );
}
