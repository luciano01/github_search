import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/repositories.dart';
import 'state.dart';

class UserRepositoryCubit extends Cubit<UserRepositoryState> {
  final UserRepositoriesRepository _getRepositoriesRepository;

  UserRepositoryCubit(this._getRepositoriesRepository)
      : super(const UserRepositoryInitial());

  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get textEditingController => _textEditingController;

  @override
  Future<void> close() {
    _textEditingController.dispose();
    return super.close();
  }

  Future<void> getUserRepositories({required String username}) async {
    try {
      emit(const UserRepositoryLoading());
      final repositories = await _getRepositoriesRepository.getUserRepositories(
        username: username,
      );
      emit(UserRepositoryLoaded(repositories));
    } catch (error) {
      emit(const UserRepositoryError('Error to search repositories!'));
    }
  }
}
