import 'package:json_annotation/json_annotation.dart';

part 'network_pokemon.g.dart';

@JsonSerializable()
class NetworkPokemon {
  final String name;

  NetworkPokemon({required this.name});

  factory NetworkPokemon.fromJson(Map<String, dynamic> json) =>
      _$NetworkPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPokemonToJson(this);

  @override
  String toString() => 'NetworkPokemon(name: $name)';
}
