import 'package:flutter_main_page/pages/root/logic.dart';
import 'package:flutter_main_page/pages/tabbar/contacts/card/state.dart';
import 'package:get/get.dart';

class CardLogic extends GetxController {
  final CardState state = CardState();

  @override
  void onReady() {
    var map = Get.arguments;
    state.userId = map["userId"];
    state.username = map["username"];
    update();

    super.onReady();
  }

  void enterChatRoom() {
    Get.back();

    // 切换tabBar
    RootLogic rootLogic = Get.find<RootLogic>();
    rootLogic.switchTap(0);
  }
}
