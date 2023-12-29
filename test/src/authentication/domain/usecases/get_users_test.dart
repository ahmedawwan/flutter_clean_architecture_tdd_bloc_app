import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/entities/user.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/usecases/get_users.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'authentication_repository.mock.dart';

void main() {
  late GetUsers usecase;
  late AuthenticationRepository repository;
  final tResponse = [User.empty()];
  setUp(
    () {
      repository = MockAuthRepo();
      usecase = GetUsers(repository);
    },
  );
  test(
      'should call the [AuthenticationRepository.getUsers] and return [List<User>]',
      () async {
    // Arrange
    when(
      () => repository.getUsers(),
    ).thenAnswer(
      (_) async => Right(tResponse),
    );
    // Act
    final result = await usecase.call();
    // Assert
    expect(
      result,
      equals(
        Right<dynamic, List<User>>(tResponse),
      ),
    );
    verify(
      () => repository.getUsers(),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}
