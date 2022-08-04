import 'package:get/get.dart';

import 'state.dart';

class SessionLogic extends GetxController {
  final SessionState state = SessionState();

  void switchChatRoom(int index) {
    state.selectedIndex = index;
    state.userId = "$index";
    state.username = "冯$index";

    update();
  }
}
