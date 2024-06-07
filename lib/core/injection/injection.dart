import 'package:code_generation_flutter/src/blocs/bloc/user_bloc.dart';
import 'package:code_generation_flutter/src/data/providers/user_provider.dart';
import 'package:code_generation_flutter/src/data/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final dio = Dio(BaseOptions(baseUrl: 'https://reqres.in'));

  getIt
    ..registerFactory(
      () => UserBloc(repository: getIt()),
    )
    ..registerLazySingleton(
      () => UserRepository(provider: getIt()),
    )
    ..registerLazySingleton(
      () => UserProvider(dio: getIt()),
    )
    ..registerLazySingleton(
      () => dio,
    );
}
