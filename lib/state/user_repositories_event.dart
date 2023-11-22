abstract class UserRepositoryEvent {}

class UserRepositories extends UserRepositoryEvent {
  final String userName;

  UserRepositories(this.userName);
}
