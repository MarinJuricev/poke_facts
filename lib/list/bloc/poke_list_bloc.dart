import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_facts/list/bloc/poke_list_event.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';
import 'package:poke_facts/list/usecase/get_pokemons.dart';

class PokeListBloc extends Bloc<PokeListEvent, PokeListState> {
  static const _debounceDuration = Duration(milliseconds: 500);
  final GetPokemons getPokemons;

  PokeListBloc({required this.getPokemons}) : super(const PokeListState()) {
    on<OnLoad>((event, emit) async {
      emit(state.copyWith(query: event.query));
      await _loadPokemon(event.query, emit);
    });

    on<PokeListQueryChanged>(
      (event, emit) async {
        emit(state.copyWith(query: event.query));
        // Wait for the debounce duration.
        await Future.delayed(_debounceDuration);

        // If the state's query is still equal to the event query, trigger the API call.
        if (state.query == event.query) {
          await _loadPokemon(event.query, emit);
        }
      },
    );
  }

  Future<void> _loadPokemon(String query, Emitter<PokeListState> emit) async {
    final result = await getPokemons(query).run();
    result.fold(
      (failure) {
        print(failure);
      },
      (pokemon) {
        print(pokemon);
        final newItem = PokeListItem(
          text: pokemon.name,
          height: pokemon.height,
          weight: pokemon.weight,
          color: Colors.green, // Choose color based on your logic.
        );
        emit(state.copyWith(gridItems: [newItem]));
      },
    );
  }
}
