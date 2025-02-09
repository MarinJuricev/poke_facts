import 'package:get_it/get_it.dart';
import 'package:poke_facts/home/bloc/home_bloc.dart';

final getIt = GetIt.instance;

void loadHomeModule() {
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
}
