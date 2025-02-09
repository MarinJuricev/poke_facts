import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/models/repository_error.dart';
import 'package:poke_facts/core/network/network_service.dart';
import 'package:poke_facts/list/model/network_pokemon.dart';

class DioNetworkService implements NetworkService {
  final Dio dio;

  DioNetworkService({required this.dio});

  @override
  TaskEither<RepositoryError, NetworkPokemon> getPokemon(String name) {
    return TaskEither<RepositoryError, NetworkPokemon>(() async {
      try {
        // TODO: Introduce a network/error mapper
        final response = await dio.get<NetworkPokemon>('pokemon/$name');
        if (response.statusCode == 200 && response.data != null) {
          return right(response.data!);
        } else {
          return left(CodeFailure(statusCode: response.statusCode ?? 0));
        }
      } catch (e) {
        return left(const UnknownRepositoryError());
      }
    });
  }
}
