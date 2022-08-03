import 'package:flutter_main_page/route/route_name.dart';
import 'package:get/get.dart';

class ContactsLogic extends GetxController {
  void switchSessionPage() {
    //TODO:tabBar切换
    Get.toNamed(RouteName.mine);
  }

  void pushDetailPage() {
    //TODO:不隐藏式跳转
    Get.toNamed(RouteName.detail);
  }
}
