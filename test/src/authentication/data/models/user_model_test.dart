import 'dart:convert';
import 'package:clean_architecture_tdd_bloc_app/core/utils/typedef.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/data/models/user_model.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = UserModel.empty();
  test(
    "should be a subclass of [User] entity",
    () {
      // Arrange
      // Act
      // Assert
      expect(
        tModel,
        isA<User>(),
      );
    },
  );

  final tJson = fixture("user.json");
  final tMap = jsonDecode(tJson) as DataMap;

  group(
    "fromMap",
    () {
      test(
        "should return a [UserModel] with the right data",
        () {
          // Arrange
          // Act
          final result = UserModel.fromMap(tMap);
          // Assert
          expect(result, equals(tModel));
        },
      );
    },
  );
}
