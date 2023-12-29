import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final DateTime createdAt;
  final String name;
  final String avatar;

  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
    };
  }

  User.empty()
      : this(
          id: 1,
          createdAt: DateTime.now(),
          avatar: "_empty.avatar",
          name: "_empty.name",
        );

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: int.parse(map['id'] as String),
      createdAt: DateTime.parse(map['createdAt'] as String),
      name: map['name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
      ];
}
