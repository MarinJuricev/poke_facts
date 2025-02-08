import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) {
      switch (event) {
        case QueryChanged():
          emit(state.copyWith(query: event.query));
        case HomeLoadEvent():
          emit(state.copyWith(gridItems: _generateGridItems()));
      }
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
