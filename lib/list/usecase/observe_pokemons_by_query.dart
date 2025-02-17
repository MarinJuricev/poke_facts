import 'dart:async';

import 'package:poke_facts/list/model/pokemon.dart';
import 'package:poke_facts/list/repository/pokemon_repository.dart';

class ObservePokemonsByQuery {
  final PokemonRepository repository;

  ObservePokemonsByQuery({required this.repository});

  Stream<List<Pokemon>> call(String query) {
    return repository.observePokemons(query).transform(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) {
              sink.add(data);
            },
            handleError: (error, stackTrace, sink) {
              print('TODO: Handle me');
            },
          ),
        );
  }
}
