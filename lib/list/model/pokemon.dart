import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final int height;
  final int weight;
  final String image;

  const Pokemon({
    required this.name,
    required this.height,
    required this.weight,
    required this.image,
  });

  @override
  List<Object?> get props => [name, height, weight, image];
}
