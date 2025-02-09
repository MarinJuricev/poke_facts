import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;

  const Pokemon({required this.name});

  @override
  String toString() => 'Pokemon(name: $name)';

  @override
  List<Object?> get props => [name];
}
