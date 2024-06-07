import 'package:code_generation_flutter/core/errors/exceptions.dart';
import 'package:code_generation_flutter/core/errors/failures.dart';
import 'package:code_generation_flutter/src/data/models/user_model.dart';
import 'package:code_generation_flutter/src/data/providers/user_provider.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  const UserRepository({
    required UserProvider provider,
  }) : _provider = provider;

  final UserProvider _provider;

  Future<Either<Failure, List<UserModel>>> getUsers() async {
    try {
      final result = await _provider.getUsers();

      return Right(result);
    } on HttpException catch (e) {
      return Left(HttpFailure.fromException(e));
    } on GeneralException catch (e) {
      return Left(GeneralFailure.fromException(e));
    }
  }
}
