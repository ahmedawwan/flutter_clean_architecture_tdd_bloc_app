import 'dart:convert';
import 'package:clean_architecture_tdd_bloc_app/core/utils/typedef.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.avatar,
    required super.name,
    required super.createdAt,
  });

  String toJson() => jsonEncode(toMap());

  DataMap toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
    };
  }

  UserModel.empty()
      : this(
          id: "1",
          createdAt: DateTime.now(),
          avatar: "_empty.avatar",
          name: "_empty.name",
        );

  UserModel copyWith({
    String? avatar,
    String? id,
    String? name,
    DateTime? createdAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        avatar: avatar ?? this.avatar,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );

  factory UserModel.fromJson(String source) => UserModel.fromMap(
        jsonDecode(source) as DataMap,
      );

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          createdAt: DateTime.parse(map['createdAt'] as String),
          name: map['name'] as String,
          avatar: map['avatar'] as String,
        );
}
