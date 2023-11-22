import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'repositories/repositories.dart';
import 'state/state.dart';
import 'views/home_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final client = http.Client();

    return MaterialApp(
      title: 'GitHub Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Provider(
              create: (context) => UserRepositoryState(
                UserRepositoriesRepositoryImpl(client),
              ),
              dispose: (context, value) {
                value.textEditingController.dispose();
              },
              child: const HomeView(),
            ),
      },
    );
  }
}
