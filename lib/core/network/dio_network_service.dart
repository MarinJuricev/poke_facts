import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poke_facts/core/models/repository_error.dart';
import 'package:poke_facts/core/network/network_service.dart';
import 'package:poke_facts/list/model/network_pokemon.dart';

class DioNetworkService implements NetworkService {
  final Dio dio;
  CancelToken? _cancelToken;

  DioNetworkService({required this.dio});

  @override
  TaskEither<RepositoryError, List<NetworkPokemon>> getPokemons() {
    return TaskEither.tryCatch(
          () async {
        _cancelToken?.cancel();
        _cancelToken = CancelToken();

        final response = await dio.get(
          'pokemon?limit=100000',
          cancelToken: _cancelToken,
        );
        if (response.statusCode == 200 && response.data != null) {
          final results = response.data['results'] as List<dynamic>;
          return results.map((json) => NetworkPokemon.fromJson(json)).toList();
        } else {
          throw CodeFailure(statusCode: response.statusCode ?? 0);
        }
      },
          (error, stacktrace) {
        print('The error is $error, and the stacktrace is $stacktrace');
        return error is RepositoryError
            ? error
            : const UnknownRepositoryError();
      },
    );
  }
}
