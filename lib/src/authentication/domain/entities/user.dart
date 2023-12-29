import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final DateTime createdAt;
  final String name;
  final String avatar;

  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  User.empty()
      : this(
          id: "1",
          createdAt: DateTime.parse("2023-12-29 14:45:38.610989"),
          avatar: "_empty.avatar",
          name: "_empty.name",
        );

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        avatar,
      ];
}
