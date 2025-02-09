import 'package:equatable/equatable.dart';

sealed class PokeListEvent extends Equatable {
  const PokeListEvent();
}

final class OnLoad extends PokeListEvent {
  final String query;

  const OnLoad(this.query);

  @override
  List<Object?> get props => [query];
}

final class PokeListQueryChanged extends PokeListEvent {
  final String query;

  const PokeListQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}
