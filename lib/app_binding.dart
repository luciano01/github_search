import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'repositories/repositories.dart';
import 'state/state.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final client = http.Client();

    Get.lazyPut(
      () => UserRepositoryState(
        UserRepositoriesRepositoryImpl(client),
      ),
    );
  }
}
