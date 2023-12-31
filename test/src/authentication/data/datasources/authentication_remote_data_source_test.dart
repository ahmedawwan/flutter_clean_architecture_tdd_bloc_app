import 'package:clean_architecture_tdd_bloc_app/core/utils/constants.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client dioClient;
  late AuthenticationRemoteDataSource remoteDataSource;

  setUp(() {
    dioClient = MockClient();
    remoteDataSource = AuthenticationRemoteDataSourceImplementations(dioClient);
    registerFallbackValue(Uri());
  });

  group("createUser", () {
    test("should complete successfully when the status code is 201 or 200",
        () async {
      when(() => dioClient.post(any(), body: any(named: "body"))).thenAnswer(
        (_) async => http.Response(
          "User Created Successfully",
          201,
        ),
      );

      final methodCall = remoteDataSource.createUser;

      expect(
          methodCall(
              createdAt: DateTime.parse("2023-12-29 14:45:38.610989"),
              name: "name",
              avatar: "avatar"),
          completes);

      verify(
        () => dioClient.post(
          Uri.parse(kCreateUserEndpoint),
          body: {
            "createdAt": DateTime.parse("2023-12-29 14:45:38.610989"),
            "name": "name",
            "avatar": "avatar",
          },
        ),
      ).called(1);

      verifyNoMoreInteractions(dioClient);
    });
  });
}
