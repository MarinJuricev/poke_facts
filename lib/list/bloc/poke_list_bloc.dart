import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_facts/list/bloc/poke_list_event.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';
import 'package:poke_facts/list/usecase/get_pokemons.dart';
import 'package:rxdart/rxdart.dart';

class PokeListBloc extends Bloc<PokeListEvent, PokeListState> {
  static const _debounceDuration = Duration(milliseconds: 500);
  final GetPokemons getPokemons;

  PokeListBloc({required this.getPokemons}) : super(const PokeListState()) {
    on<OnLoad>((event, emit) {
      emit(state.copyWith(query: event.query));
    });
    on<PokeListQueryChanged>(
      (event, emit) {
        emit(state.copyWith(query: event.query));
      },
      transformer: (events, mapper) =>
          events.debounceTime(_debounceDuration).switchMap(mapper),
    );
  }
}
