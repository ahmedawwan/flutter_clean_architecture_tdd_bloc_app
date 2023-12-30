import 'package:clean_architecture_tdd_bloc_app/core/errors/exceptions.dart';
import 'package:clean_architecture_tdd_bloc_app/core/errors/failure.dart';
import 'package:clean_architecture_tdd_bloc_app/core/utils/typedef.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/entities/user.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImplementations
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementations(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUser({
    required DateTime createdAt,
    required String name,
    required String avatar,
  }) async {
    // call the remote data source
    try {
      _remoteDataSource.createUser(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      );
    } on ApiException catch (e) {
      return Left(
        ApiFailure.fromException(e),
      );
    }
    return const Right(null);

    // check if the method returns the proper data

    // if the remoteDataSource throws an exception we return a failure

    // if it doesn't throw an exception we return the actual expected data
  }

  @override
  ResultFuture<List<User>> getUsers() {
    throw UnimplementedError();
  }
}
