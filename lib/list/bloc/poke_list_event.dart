import 'package:equatable/equatable.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';
import 'package:poke_facts/list/model/pokemon.dart';

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

final class PokeListUpdated extends PokeListEvent {
  final List<Pokemon> pokemonList;

  const PokeListUpdated(this.pokemonList);

  @override
  List<Object?> get props => [pokemonList];
}

final class PokeListError extends PokeListEvent {
  final String errorMessage;

  const PokeListError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class PokeListItemClicked extends PokeListEvent {
  final PokeListItem item;

  const PokeListItemClicked(this.item);

  @override
  List<Object?> get props => [item];
}
