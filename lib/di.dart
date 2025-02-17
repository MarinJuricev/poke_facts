import 'package:get_it/get_it.dart';
import 'package:poke_facts/core/local/di/local_module.dart';
import 'package:poke_facts/core/network/di/network_module.dart';
import 'package:poke_facts/core/provider/di/provider_module.dart';
import 'package:poke_facts/list/di/poke_list_module.dart';

import 'home/di/home_module.dart';

final getIt = GetIt.instance;

Future<void> loadDependencies() async {
  loadProviderModule();
  loadNetworkModule();
  loadLocalModule();
  loadHomeModule();
  loadPokemonListModule();

  await getIt.allReady();
}
