import '../models/models.dart';

abstract class UserRepositoryState {
  const UserRepositoryState();
}

class UserRepositoryInitial extends UserRepositoryState {
  const UserRepositoryInitial();
}

class UserRepositoryLoading extends UserRepositoryState {
  const UserRepositoryLoading();
}

class UserRepositoryLoaded extends UserRepositoryState {
  final List<UserRepositoryModel> repositories;
  const UserRepositoryLoaded(this.repositories);
}

class UserRepositoryError extends UserRepositoryState {
  final String message;
  const UserRepositoryError(this.message);
}
