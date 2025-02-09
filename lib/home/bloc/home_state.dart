import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String query,
    @Default([]) List<HomeGridItem> gridItems,
  }) = _HomeState;
}

@freezed
class HomeGridItem with _$HomeGridItem {
  const factory HomeGridItem({
    required String text,
    required Color color,
  }) = _HomeGridItem;
}
