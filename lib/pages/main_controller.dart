import 'package:get/get.dart';

class MainController extends GetxController {
int isSelected=0;

void changeColor(index){
  isSelected=index;
  update();
}

  final List<String> textlist = [
      'Trending Now',
      '2021 New In',
      'Tiktok',
      'On The Trend',
    ];
 
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
