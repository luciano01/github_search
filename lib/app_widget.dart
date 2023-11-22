import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'repositories/repositories.dart';
import 'state/state.dart';
import 'views/views.dart';

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
        "/": (context) => BlocProvider(
              create: (context) => UserRepositoryCubit(
                UserRepositoriesRepositoryImpl(client),
              ),
              child: const HomeView(),
            ),
      },
    );
  }
}
