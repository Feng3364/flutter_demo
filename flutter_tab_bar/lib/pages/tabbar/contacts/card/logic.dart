import 'package:flutter_main_page/pages/root/logic.dart';
import 'package:flutter_main_page/pages/tabbar/contacts/card/state.dart';
import 'package:flutter_main_page/pages/tabbar/session/logic.dart';
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
    rootLogic.switchTabBar(0);

    // 切换聊天室
    SessionLogic sessionLogic = Get.find<SessionLogic>();
    sessionLogic.switchChatRoom(int.parse(state.userId));
  }
}
