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
      _observePokemons(event.query);
    });

    on<PokeListQueryChanged>((event, emit) async {
      emit(state.copyWith(query: event.query));
      await Future.delayed(_debounceDuration);

      if (state.query == event.query) {
        _observePokemons(event.query);
      }
    });

    on<PokeListUpdated>((event, emit) {
      final items =
          event.pokemonList.map((pokemon) {
            return PokeListItem(
              id: pokemon.id,
              types: pokemon.types,
              text: pokemon.name,
              url: pokemon.image,
              height: pokemon.height,
              weight: pokemon.weight,
              color: Colors.green,
            );
          }).toList();
      emit(state.copyWith(items: items, errorMessage: null));
    });

    on<PokeListError>((event, emit) {
      emit(state.copyWith(errorMessage: event.errorMessage));
    });
  }

  void _observePokemons(String query) {
    _subscription?.cancel();
    _subscription = observePokemons(query).listen(
      (pokemonList) {
        add(PokeListUpdated(pokemonList));
      },
      onError: (error) {
        add(PokeListError(error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
