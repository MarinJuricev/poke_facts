import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static const _debounceDuration = Duration(milliseconds: 500);

  HomeBloc() : super(const HomeState()) {
    on<QueryChanged>(
      (event, emit) {
        emit(state.copyWith(query: event.query));
      },
      transformer: (events, mapper) =>
          events.debounceTime(_debounceDuration).switchMap(mapper),
    );

    on<HomeLoadEvent>((event, emit) {
      emit(state.copyWith(gridItems: _generateGridItems()));
    });
  }

  List<HomeGridItem> _generateGridItems() {
    return [
      HomeGridItem(text: 'Pokedex', color: Colors.green),
      HomeGridItem(text: 'Moves', color: Colors.red),
      HomeGridItem(text: 'Abilities', color: Colors.blue),
      HomeGridItem(text: 'Items', color: Colors.yellow),
      HomeGridItem(text: 'Locations', color: Colors.purple),
      HomeGridItem(text: 'TypeEffect', color: Colors.brown),
    ];
  }
}
