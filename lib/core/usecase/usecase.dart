import 'package:clean_architecture_tdd_bloc_app/core/utils/typedef.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UseCase<Type> {
  const UseCase();
  ResultFuture<Type> call();
}
