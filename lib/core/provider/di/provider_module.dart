import 'package:poke_facts/core/provider/date_provider.dart';
import 'package:poke_facts/di.dart';
import 'package:poke_facts/list/repository/pokemon_repository.dart';
import 'package:poke_facts/sync/usecase/sync_pokemons.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loadProviderModule() async {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  getIt.registerFactory<DateProvider>(() => SystemDateProvider());

  getIt.registerFactory<SyncPokemons>(
    () => SyncPokemons(
      pokemonRepository: getIt<PokemonRepository>(),
      prefs: getIt<SharedPreferences>(),
      dateProvider: getIt<DateProvider>(),
    ),
  );
}
