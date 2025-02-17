import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_facts/list/bloc/poke_list_event.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';
import 'package:poke_facts/list/model/pokemon.dart';
import 'package:poke_facts/list/usecase/observe_pokemons_by_query.dart';

class PokeListBloc extends Bloc<PokeListEvent, PokeListState> {
  static const _debounceDuration = Duration(milliseconds: 500);
  final ObservePokemonsByQuery observePokemons;
  StreamSubscription<List<Pokemon>>? _subscription;

  PokeListBloc({required this.observePokemons}) : super(const PokeListState()) {
    on<OnLoad>((event, emit) async {
      emit(state.copyWith(query: event.query));
      _observePokemons(event.query, emit);
    });

    on<PokeListQueryChanged>(
      (event, emit) async {
        emit(state.copyWith(query: event.query));
        await Future.delayed(_debounceDuration);

        if (state.query == event.query) {
          _observePokemons(event.query, emit);
        }
      },
    );
  }

  void _observePokemons(String query, Emitter<PokeListState> emit) {
    _subscription?.cancel();

    _subscription = observePokemons(query).listen(
      (pokemonList) {
        final items = pokemonList.map((pokemon) {
          return PokeListItem(
            text: pokemon.name,
            height: pokemon.height,
            weight: pokemon.weight,
            color: Colors.green,
          );
        }).toList();
        emit(state.copyWith(gridItems: items, errorMessage: null));
      },
      onError: (error) {
        emit(state.copyWith(errorMessage: error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
