import 'package:fashion_store/pages/home/home_view.dart';
import '../pages/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
    );
  }
}
