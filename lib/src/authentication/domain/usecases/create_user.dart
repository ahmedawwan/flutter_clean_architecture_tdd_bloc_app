import 'package:clean_architecture_tdd_bloc_app/core/usecase/usecase.dart';
import 'package:clean_architecture_tdd_bloc_app/core/utils/typedef.dart';
import 'package:clean_architecture_tdd_bloc_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class CreateUser extends UseCaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture call(CreateUserParams params) async => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  final String name;
  final String avatar;
  final DateTime createdAt;

  const CreateUserParams({
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  CreateUserParams.empty()
      : this(
          createdAt: DateTime.now(),
          avatar: "_empty.avatar",
          name: "_empty.name",
        );

  @override
  List<Object?> get props => [
        name,
        avatar,
      ];
}
