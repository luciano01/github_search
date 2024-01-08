import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

class UserRepositoryState {
  final UserRepositoriesRepositoryImpl _userRepositoriesRepositoryImpl;

  UserRepositoryState(this._userRepositoriesRepositoryImpl) {
    getUserRepositories();
  }

  final TextEditingController _textEditingController = TextEditingController(
    text: 'luciano01',
  );
  TextEditingController get textEditingController => _textEditingController;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _repositories = RxList<UserRepositoryModel>();
  List<UserRepositoryModel> get repositories => _repositories;

  Future<void> getUserRepositories() async {
    try {
      _isLoading.value = true;
      Future.delayed(const Duration(seconds: 2)).then((_) async {
        _repositories.value =
            await _userRepositoriesRepositoryImpl.userRepositories(
          username: _textEditingController.text,
        );
        _isLoading.value = false;
      });
    } catch (e) {
      throw Exception();
    }
  }
}
