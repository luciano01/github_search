// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repositories_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserRepositoryState on UserRepositoryStateBase, Store {
  late final _$repositoriesAtom =
      Atom(name: 'UserRepositoryStateBase.repositories', context: context);

  @override
  ObservableFuture<List<UserRepositoryModel>> get repositories {
    _$repositoriesAtom.reportRead();
    return super.repositories;
  }

  @override
  set repositories(ObservableFuture<List<UserRepositoryModel>> value) {
    _$repositoriesAtom.reportWrite(value, super.repositories, () {
      super.repositories = value;
    });
  }

  late final _$getUserRepositoriesAsyncAction = AsyncAction(
      'UserRepositoryStateBase.getUserRepositories',
      context: context);

  @override
  Future<void> getUserRepositories({required String userName}) {
    return _$getUserRepositoriesAsyncAction
        .run(() => super.getUserRepositories(userName: userName));
  }

  @override
  String toString() {
    return '''
repositories: ${repositories}
    ''';
  }
}
