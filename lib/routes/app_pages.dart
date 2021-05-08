import 'package:fashion_store/pages/main_binding.dart';
import 'package:fashion_store/pages/main_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  static final routes=[
    GetPage(
      name: Routes.HOME,
      page: ()=>MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: ()=>MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: ()=>MainView(),
      binding: MainBinding(),
    ),
  ];
}
