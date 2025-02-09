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
    //TODO Introduce a network mapper, this could get repeated N times
    return TaskEither.tryCatch(
      () async {
        final response = await dio.get<NetworkPokemon>('pokemon/$name');
        if (response.statusCode == 200 && response.data != null) {
          return response.data!;
        } else {
          throw CodeFailure(statusCode: response.statusCode ?? 0);
        }
      },
      (error, _) =>
          error is RepositoryError ? error : const UnknownRepositoryError(),
    );
  }
}
