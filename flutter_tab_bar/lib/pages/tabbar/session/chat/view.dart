import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/tabbar/session/state.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final ChatLogic logic = Get.put(ChatLogic());
  final SessionState sessionState = Get.find<ChatLogic>().sessionState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sessionState.username),
        actions: [
          GestureDetector(
            onTap: () => logic.pushCardPage(),
            child: const Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
