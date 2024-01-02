import 'package:clean_architecture_tdd_bloc_app/core/errors/exceptions.dart';
import 'package:clean_architecture_tdd_bloc_app/core/errors/failure.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRemoteDataSource extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImplementations repositoryImplementations;

  setUp(
    () {
      remoteDataSource = MockAuthenticationRemoteDataSource();
      repositoryImplementations =
          AuthenticationRepositoryImplementations(remoteDataSource);
    },
  );

  const tException = ApiException(
    message: "Unknown error occurred",
    statusCode: 500,
  );

  group("createUser", () {
    final createdAt = DateTime.parse("2023-12-29 14:45:38.610989");
    const name = "name";
    const avatar = "avatar";
    test(
      "should call the [RemoteDataSource.createUser] and complete successfully when the call to the remote source is successful",
      () async {
        // arrange
        when(
          () => remoteDataSource.createUser(
            createdAt: any(named: "createdAt"),
            name: any(named: "name"),
            avatar: any(named: "avatar"),
          ),
        ).thenAnswer(
          (_) async => Future.value(),
        );

        // act
        final result = await repositoryImplementations.createUser(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        );

        // assert
        expect(result, equals(const Right(null)));
        verify(
          () => remoteDataSource.createUser(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
    test(
      "should return a [ServerFailure] when the call to the remote source is unsuccessful",
      () async {
        // arrange
        when(
          () => remoteDataSource.createUser(
            createdAt: any(named: "createdAt"),
            name: any(named: "name"),
            avatar: any(named: "avatar"),
          ),
        ).thenThrow(tException);
        // act
        final result = await repositoryImplementations.createUser(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        );
        // assert
        expect(
          result,
          equals(
            Left(
              ApiFailure.fromException(tException),
            ),
          ),
        );

        verify(() => remoteDataSource.createUser(
            createdAt: createdAt, name: name, avatar: avatar)).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  group("getUsers", () {
    test(
        "should call the [RemoteDataSource.getUsers] and return [List<User>] when call to remote source is successful",
        () async {
      when(() => remoteDataSource.getUsers()).thenAnswer((_) async => []);

      final result = await repositoryImplementations.getUsers();

      expect(result, isA<Right<dynamic, List<User>>>());
      verify(() => remoteDataSource.getUsers()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
      "should return a [ServerFailure] when the call to the remote source is unsuccessful",
      () async {
        // arrange
        when(
          () => remoteDataSource.getUsers(),
        ).thenThrow(tException);
        // act
        final result = await repositoryImplementations.getUsers();
        // assert
        expect(
          result,
          equals(
            Left(
              ApiFailure.fromException(tException),
            ),
          ),
        );

        verify(() => remoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
