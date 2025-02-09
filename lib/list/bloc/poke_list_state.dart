import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poke_list_state.freezed.dart';

@freezed
class PokeListState with _$PokeListState {
  const factory PokeListState({
    @Default(null) String? query,
    @Default([]) List<PokeListItem> gridItems,
  }) = _PokeListState;
}

@freezed
class PokeListItem with _$PokeListItem {
  const factory PokeListItem({
    required String text,
    required Color color,
  }) = _PokeListItem;
}

