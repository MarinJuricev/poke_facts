// repository_error.dart
import 'package:equatable/equatable.dart';

sealed class RepositoryError extends Equatable {
  const RepositoryError();
}

class UnknownRepositoryError extends RepositoryError {
  const UnknownRepositoryError();

  @override
  List<Object?> get props => [];
}

class CodeFailure extends RepositoryError {
  final int statusCode;

  const CodeFailure({required this.statusCode});

  @override
  List<Object?> get props => [statusCode];
}
