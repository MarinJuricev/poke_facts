import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final int height;
  final int weight;

  const Pokemon({
    required this.name,
    required this.height,
    required this.weight,
  });

  @override
  String toString() =>
      'Pokemon(name: $name, height: $height, weight: $weight)';

  @override
  List<Object?> get props => [name, height, weight];
}
