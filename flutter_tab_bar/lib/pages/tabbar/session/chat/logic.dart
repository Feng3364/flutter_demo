import 'package:flutter_main_page/pages/tabbar/session/state.dart';
import 'package:flutter_main_page/route/route_name.dart';
import 'package:get/get.dart';

import '../logic.dart';

class ChatLogic extends GetxController {
  final SessionState sessionState = Get.find<SessionLogic>().state;

  void pushCardPage() {
    Get.toNamed(
      RouteName.card,
      arguments: {
        "userId": sessionState.userId,
        "username": sessionState.username,
      },
    );
  }
}
