import 'package:clean_architecture_tdd_bloc_app/core/utils/constants.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({
    required DateTime createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}

const kCreateUserEndpoint = "$kBaseUrl/users";
const kGetUserEndpoint = "$kBaseUrl/users";

class AuthenticationRemoteDataSourceImplementations
    implements AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImplementations(this.client);
  final http.Client client;
  @override
  Future<void> createUser(
      {required DateTime createdAt,
      required String name,
      required String avatar}) async {
    final response = client.post(Uri.parse(kCreateUserEndpoint), body: {
      "createdAt": createdAt,
      "name": name,
      "avatar": avatar,
    });
  }

  @override
  Future<List<UserModel>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
