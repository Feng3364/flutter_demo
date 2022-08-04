import 'package:flutter_main_page/pages/tabbar/session/chat/state.dart';
import 'package:flutter_main_page/route/route_name.dart';
import 'package:get/get.dart';

class ChatLogic extends GetxController {
  final ChatState state = ChatState();

  void pushCardPage() {
    Get.toNamed(
      RouteName.card,
      arguments: {
        "userId": state.userId,
        "username": state.username,
      },
    );
  }
}
