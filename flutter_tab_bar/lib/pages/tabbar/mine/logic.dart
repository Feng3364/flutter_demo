import 'package:get/get.dart';

import '../../../route/route_name.dart';

class MineLogic extends GetxController {
  void loginOut() {
    Get.offAllNamed(RouteName.login);
  }
}
