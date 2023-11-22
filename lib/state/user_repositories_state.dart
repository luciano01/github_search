import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

part 'user_repositories_state.g.dart';

class UserRepositoryState = UserRepositoryStateBase with _$UserRepositoryState;

abstract class UserRepositoryStateBase with Store {
  final UserRepositoriesRepositoryImpl _userRepositoriesRepositoryImpl;

  UserRepositoryStateBase(this._userRepositoriesRepositoryImpl);

  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get textEditingController => _textEditingController;

  @observable
  ObservableFuture<List<UserRepositoryModel>> repositories =
      ObservableFuture.value([]);

  @action
  Future<void> getUserRepositories({required String userName}) async {
    repositories = ObservableFuture(
      _userRepositoriesRepositoryImpl.userRepositories(
        username: userName,
      ),
    );
  }
}
