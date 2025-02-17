import 'package:poke_facts/core/network/network_service.dart';
import 'package:poke_facts/di.dart';
import 'package:poke_facts/list/bloc/poke_list_bloc.dart';
import 'package:poke_facts/list/repository/pokemon_repository.dart';
import 'package:poke_facts/list/repository/pokemon_repository_impl.dart';
import 'package:poke_facts/list/usecase/get_pokemons.dart';

void loadPokemonListModule() {
  getIt.registerFactory<PokeListBloc>(() => PokeListBloc(
        getPokemons: getIt<GetPokemons>(),
      ));
  getIt.registerFactory<PokemonRepository>(
    () => PokemonRepositoryImpl(
      networkService: getIt<NetworkService>(),
    ),
  );
  getIt.registerFactory<GetPokemons>(
    () => GetPokemons(
      repository: getIt<PokemonRepository>(),
    ),
  );
}
