import 'package:clean_architecture_tdd_bloc_app/core/utils/typedef.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser({
    required DateTime createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUsers();
}
