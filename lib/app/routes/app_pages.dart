import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/app/modules/home/views/Category.dart';
import 'package:flutter_application_1/app/modules/home/views/self.dart';
import 'package:flutter_application_1/app/modules/home/views/testing.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/home/views/view-next.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    
    GetPage(
      name: _Paths.DETAIL,
      page: () => viewScreen(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => categoryView(),
    ),
     GetPage(
      name: _Paths.PROFILE,
      page: () => self(),
    ),
    GetPage(
      name: _Paths.TESTING,
      page: () => Testing(data: ""),
    ),
  ];
}
