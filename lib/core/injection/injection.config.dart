// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:code_generation_flutter/core/injection/modules/injectable_modules.dart'
    as _i7;
import 'package:code_generation_flutter/src/blocs/bloc/user_bloc.dart' as _i6;
import 'package:code_generation_flutter/src/data/providers/user_provider.dart'
    as _i4;
import 'package:code_generation_flutter/src/data/repositories/user_repository.dart'
    as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModules = _$InjectableModules();
    gh.lazySingleton<_i3.Dio>(() => injectableModules.dio);
    gh.lazySingleton<_i4.UserProvider>(
        () => _i4.UserProvider(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i5.UserRepository>(
        () => _i5.UserRepository(provider: gh<_i4.UserProvider>()));
    gh.factory<_i6.UserBloc>(
        () => _i6.UserBloc(repository: gh<_i5.UserRepository>()));
    return this;
  }
}

class _$InjectableModules extends _i7.InjectableModules {}
