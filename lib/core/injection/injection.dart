import 'package:code_generation_flutter/core/injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  usesNullSafety: true,
  throwOnMissingDependencies: true,
)
void initDependencies() => getIt.init();
