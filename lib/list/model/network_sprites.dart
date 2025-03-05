import 'package:json_annotation/json_annotation.dart';

part 'network_sprites.g.dart';

@JsonSerializable()
class NetworkSprites {
  @JsonKey(name: 'back_default')
  String backDefault;
  @JsonKey(name: 'back_shiny')
  String backShiny;
  @JsonKey(name: 'front_default')
  String frontDefault;
  @JsonKey(name: 'front_shiny')
  String frontShiny;

  NetworkSprites({
    required this.frontDefault,
    required this.backDefault,
    required this.frontShiny,
    required this.backShiny,
  });

  factory NetworkSprites.fromJson(Map<String, dynamic> json) =>
      _$NetworkSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkSpritesToJson(this);
}
