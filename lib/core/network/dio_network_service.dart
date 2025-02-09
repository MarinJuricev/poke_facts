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
  TaskEither<RepositoryError, NetworkPokemon> getPokemon(String name) {
    //TODO: Wrap this in a network mapper
    return TaskEither.tryCatch(
      () async {
        _cancelToken?.cancel();
        _cancelToken = CancelToken();
        final response = await dio.get(
          'pokemon/$name',
          cancelToken: _cancelToken,
        );
        if (response.statusCode == 200 && response.data != null) {
          return NetworkPokemon.fromJson(response.data);
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
