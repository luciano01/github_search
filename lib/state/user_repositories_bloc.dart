import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../repositories/repositories.dart';
import 'state.dart';

class UserRepositoryBloc
    extends Bloc<UserRepositoryEvent, UserRepositoryState> {
  final UserRepositoriesRepository _getRepositoriesRepository;

  UserRepositoryBloc(this._getRepositoriesRepository)
      : super(const UserRepositoryInitial()) {
    on<UserRepositoryEvent>(
      (event, emit) async {
        if (event is UserRepositories) {
          try {
            emit(const UserRepositoryLoading());
            final repository =
                await _getRepositoriesRepository.getUserRepositories(
              username: event.userName,
            );
            emit(UserRepositoryLoaded(repository));
          } on Exception {
            emit(const UserRepositoryError('Error to search repositories!'));
          }
        }
      },
    );
  }

  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get textEditingController => _textEditingController;

  @override
  Future<void> close() {
    _textEditingController.dispose();
    return super.close();
  }

  // Use this approach to bloc: ^6.0.1 and flutter_bloc: ^6.0.1
  /* Stream<RepositoryState> mapEventToState(
    RepositoryEvent event,
  ) async* {
    if (event is GetUserRepositories) {
      try {
        yield const RepositoryLoading();
        final repository = await _getRepositoriesRepository.getUserRepositories(
          username: event.userName,
        );
        yield RepositoryLoaded(repository);
      } on Exception {
        yield const RepositoryError('Error to search repositories!');
      }
    }
  } */
}
