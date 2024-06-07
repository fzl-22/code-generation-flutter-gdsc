import 'package:code_generation_flutter/core/errors/exceptions.dart';
import 'package:code_generation_flutter/src/data/models/user_model.dart';
import 'package:dio/dio.dart';

class UserProvider {
  const UserProvider({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<List<UserModel>> getUsers() async {
    try {
      const path = '/api/users';

      final response = await _dio.get<Map<String, dynamic>>(path);

      final users = (response.data!['data'] as List<dynamic>)
          .map((user) => UserModel.fromMap(user as Map<String, dynamic>))
          .toList();

      return users;
    } on DioException catch (e) {
      throw HttpException.fromDio(e);
    } catch (e) {
      throw GeneralException(message: e.toString());
    }
  }
}
