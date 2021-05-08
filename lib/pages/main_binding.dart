import 'package:fashion_store/pages/main_controller.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings{
  @override
    void dependencies() {
      Get.put<MainController>(MainController());
    }
}