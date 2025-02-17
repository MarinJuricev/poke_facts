import 'package:poke_facts/core/local/local_service.dart';
import 'package:poke_facts/core/network/network_service.dart';
import 'package:poke_facts/di.dart';
import 'package:poke_facts/list/bloc/poke_list_bloc.dart';
import 'package:poke_facts/list/repository/pokemon_repository.dart';
import 'package:poke_facts/list/repository/pokemon_repository_impl.dart';
import 'package:poke_facts/list/usecase/observe_pokemons_by_query.dart';

void loadPokemonListModule() {
  getIt.registerFactory<PokeListBloc>(() => PokeListBloc(
        observePokemons: getIt<ObservePokemonsByQuery>(),
      ));
  getIt.registerFactory<PokemonRepository>(
    () => PokemonRepositoryImpl(
      networkService: getIt<NetworkService>(),
      localService: getIt<LocalService>(),
    ),
  );
  getIt.registerFactory<ObservePokemonsByQuery>(
    () => ObservePokemonsByQuery(
      repository: getIt<PokemonRepository>(),
    ),
  );
}
