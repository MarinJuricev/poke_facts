import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:poke_facts/core/network/dio_network_service.dart';
import 'package:poke_facts/core/network/network_service.dart';
import 'package:poke_facts/di.dart';

void loadNetworkModule() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      ),
    )..interceptors.add(
        LogInterceptor(
          responseBody: true,
          logPrint: (o) => debugPrint(o.toString()),
        ),
      ),
  );

  getIt.registerFactory<NetworkService>(
    () => DioNetworkService(
      dio: getIt<Dio>(),
    ),
  );
}
