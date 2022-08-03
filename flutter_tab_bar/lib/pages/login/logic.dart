import 'package:flutter_main_page/route/route_name.dart';
import 'package:get/get.dart';

class LoginLogic extends GetxController {
  void login() {
    Get.offAllNamed(RouteName.root);
  }
}
