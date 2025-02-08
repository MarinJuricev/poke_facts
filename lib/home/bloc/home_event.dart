import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class QueryChanged extends HomeEvent {
  final String query;

  const QueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

final class HomeLoadEvent extends HomeEvent {
  const HomeLoadEvent();

  @override
  List<Object?> get props => [];
}
