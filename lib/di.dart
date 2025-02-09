import 'package:get_it/get_it.dart';
import 'package:poke_facts/core/network/di/network_module.dart';
import 'package:poke_facts/list/di/poke_list_module.dart';

import 'home/di/home_module.dart';

final getIt = GetIt.instance;

Future<void> loadDependencies() async {
  loadNetworkModule();
  loadHomeModule();
  loadPokemonDetailModule();
}
