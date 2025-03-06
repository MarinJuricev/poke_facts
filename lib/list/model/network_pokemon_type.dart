import 'package:freezed_annotation/freezed_annotation.dart';
import 'network_type.dart';

part 'network_pokemon_type.g.dart';

@JsonSerializable()
class NetworkPokemonType {
  int slot;
  NetworkType type;
  NetworkPokemonType({required this.slot, required this.type});

  factory NetworkPokemonType.fromJson(Map<String, dynamic> json) =>
      _$NetworkPokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkPokemonTypeToJson(this);
}
