import 'package:clean_architecture_tdd_bloc_app/src/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({
    required DateTime createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}
