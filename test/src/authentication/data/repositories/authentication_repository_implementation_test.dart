import 'package:clean_architecture_tdd_bloc_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRemoteDataSource extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource dataSource;
  late AuthenticationRepositoryImplementations repositoryImplementations;

  setUp(
    () {
      dataSource = MockAuthenticationRemoteDataSource();
      repositoryImplementations =
          AuthenticationRepositoryImplementations(dataSource);
    },
  );
}
