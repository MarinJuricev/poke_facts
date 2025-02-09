import 'package:poke_facts/di.dart';
import 'package:poke_facts/list/bloc/poke_list_bloc.dart';

void loadPokemonDetailModule() {
  getIt.registerFactory<PokeListBloc>(() => PokeListBloc());
}
