import 'package:json_annotation/json_annotation.dart';

part 'network_pokemon.g.dart';

@JsonSerializable()
class NetworkPokemon {
  final int id;
  final String name;
  final int height;
  final int weight;

  NetworkPokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
  });

  factory NetworkPokemon.fromJson(Map<String, dynamic> json) =>
      _$NetworkPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPokemonToJson(this);

  @override
  String toString() =>
      'NetworkPokemon(name: $name, height: $height, weight: $weight)';
}
