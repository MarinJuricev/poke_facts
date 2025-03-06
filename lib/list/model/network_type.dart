import 'package:json_annotation/json_annotation.dart';

part 'network_type.g.dart';

@JsonSerializable()
class NetworkType {
  String name;
  String url;

  NetworkType({required this.name, required this.url});

  factory NetworkType.fromJson(Map<String, dynamic> json) =>
      _$NetworkTypeFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkTypeToJson(this);
}
