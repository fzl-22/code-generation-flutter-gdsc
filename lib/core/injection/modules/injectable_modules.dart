import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModules {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: 'https://reqres.in'));
}
