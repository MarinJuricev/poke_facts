import 'package:equatable/equatable.dart';
import 'package:poke_facts/core/models/poke_type.dart';

class Pokemon extends Equatable {
  final String id;
  final String name;
  final int height;
  final int weight;
  final String image;
  final List<PokeType> types;

  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.image,
    required this.types,
  });

  @override
  List<Object?> get props => [id, name, height, weight, image, types];
}
