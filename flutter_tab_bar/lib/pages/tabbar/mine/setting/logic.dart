import 'package:get/get.dart';

import '../../../../route/route_name.dart';

class SettingLogic extends GetxController {
  void loginOut() {
    Get.offAllNamed(RouteName.login);
  }
}
