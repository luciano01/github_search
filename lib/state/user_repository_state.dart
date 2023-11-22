import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

class UserRepositoryState {
  final UserRepositoriesRepositoryImpl _userRepositoriesRepositoryImpl;

  UserRepositoryState(this._userRepositoriesRepositoryImpl);

  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get textEditingController => _textEditingController;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _repositories = RxList<UserRepositoryModel>();
  List<UserRepositoryModel> get repositories => _repositories;

  Future<void> getUserRepositories({required String userName}) async {
    _isLoading.value = true;
    _repositories.value =
        await _userRepositoriesRepositoryImpl.userRepositories(
      username: userName,
    );
    _isLoading.value = false;
  }
}
