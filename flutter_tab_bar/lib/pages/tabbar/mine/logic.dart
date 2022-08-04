import 'package:get/get.dart';

import '../../../route/route_name.dart';

class MineLogic extends GetxController {
  void pushSettingPage() {
    Get.toNamed(RouteName.setting);
  }

  void loginOut() {
    Get.offAllNamed(RouteName.login);
  }
}
