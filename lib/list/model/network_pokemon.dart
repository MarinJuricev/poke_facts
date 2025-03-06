import 'package:json_annotation/json_annotation.dart';
import 'package:poke_facts/list/model/network_pokemon_type.dart';
import 'package:poke_facts/list/model/network_sprites.dart';

part 'network_pokemon.g.dart';

@JsonSerializable()
class NetworkPokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final NetworkSprites sprites;
  final List<NetworkPokemonType> types;

  NetworkPokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.sprites,
    required this.types,
  });

  factory NetworkPokemon.fromJson(Map<String, dynamic> json) =>
      _$NetworkPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPokemonToJson(this);
}
