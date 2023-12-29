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

  group(
    "fromJson",
    () {
      test(
        "should return a [UserModel] with the right data",
        () {
          // Arrange
          // Act
          final result = UserModel.fromJson(tJson);
          // Assert
          expect(result, equals(tModel));
        },
      );
    },
  );

  group(
    "toMap",
    () {
      test(
        "should return a [Map] with the right data",
        () {
          // Arrange
          // Act
          final result = tModel.toMap();
          // Assert
          expect(result, equals(tMap));
        },
      );
    },
  );

  group(
    "toJson",
    () {
      test(
        "should return [JSON] string with the right data",
        () {
          // Arrange
          // Act
          final tJson = jsonEncode({
            "id": "1",
            "createdAt": "2023-12-29 14:45:38.610989",
            "name": "_empty.name",
            "avatar": "_empty.avatar"
          });
          final result = tModel.toJson();
          // Assert
          expect(result, equals(tJson));
        },
      );
    },
  );

  group(
    "copyWith",
    () {
      test(
        "should return [UserModel] with the different data",
        () {
          // Arrange
          // Act
          final result = tModel.copyWith(name: 'Paul');
          // Assert
          expect(result.name, equals('Paul'));
          expect(result, isNot(tModel));
        },
      );
    },
  );
}
