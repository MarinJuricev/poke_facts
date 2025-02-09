import 'package:poke_facts/di.dart';
import 'package:poke_facts/home/bloc/home_bloc.dart';

 void loadHomeModule() {
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
}
