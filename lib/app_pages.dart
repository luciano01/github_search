import 'package:get/get.dart';

import 'app_binding.dart';
import 'app_routes.dart';
import 'views/home_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
