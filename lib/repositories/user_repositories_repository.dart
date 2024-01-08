import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

abstract class UserRepositoriesRepository {
  Future<List<UserRepositoryModel>> userRepositories(
      {required String username});
}

class UserRepositoriesRepositoryImpl implements UserRepositoriesRepository {
  final http.Client client;

  UserRepositoriesRepositoryImpl(this.client);

  @override
  Future<List<UserRepositoryModel>> userRepositories({
    required String username,
  }) async {
    final finalUsername = username.isEmpty ? 'luciano01' : username;
    final response = await client.get(
      Uri.parse('https://api.github.com/users/$finalUsername/repos'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return UserRepositoryModel.fromJsonList(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
