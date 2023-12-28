import 'package:clean_architecture_tdd_bloc_app/core/usecase/usecase.dart';
import 'package:clean_architecture_tdd_bloc_app/core/utils/typedef.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/entities/user.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UseCase<List<User>> {
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
