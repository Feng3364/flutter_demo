import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SessionLogic extends GetxController {
  void switchChatItem(int index) {
    debugPrint("切换到第$index个聊天窗口");
  }
}
