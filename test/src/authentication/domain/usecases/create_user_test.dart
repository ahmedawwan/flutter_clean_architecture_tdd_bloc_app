import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/usecases/create_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

// 1. What does the class depend on
//    Authentication Repository
// 2. how can we create a fake version of dependency
//    Use MockTail
// 3. how do we control what our dependencies do
//    Using mocktail api


void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;
  final params = CreateUserParams.empty();
  setUp(
    () {
      repository = MockAuthRepo();
      usecase = CreateUser(repository);
      // registerFallbackValue(User());
    },
  );
  test('should call the [AuthenticationRepository.createUser]', () async {
    // Arrange
    when(
      () => repository.createUser(
        createdAt: any(named: 'createdAt'),
        name: any(named: 'name'),
        avatar: any(named: 'avatar'),
      ),
    ).thenAnswer(
      (_) async => const Right(null),
    );
    // Act
    final result = await usecase.call(params);
    // Assert
    expect(
      result,
      equals(
        const Right<dynamic, void>(null),
      ),
    );
    verify(
      () => repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      ),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
