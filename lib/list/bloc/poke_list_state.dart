import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_facts/core/models/poke_type.dart';

part 'poke_list_state.freezed.dart';

@freezed
class PokeListState with _$PokeListState {
  const factory PokeListState({
    @Default(null) String? query,
    @Default(null) String? errorMessage,
    @Default(null) PokeListItem? navigationItem,
    @Default([]) List<PokeListItem> items,
  }) = _PokeListState;
}

@freezed
class PokeListItem with _$PokeListItem {
  const factory PokeListItem({
    required String id,
    required String text,
    required String url,
    required int height,
    required int weight,
    required Color color,
    required List<PokeType> types,
  }) = _PokeListItem;
}
