import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/tabbar/session/chat/state.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final ChatLogic logic = Get.put(ChatLogic());
  final ChatState state = Get.find<ChatLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.username),
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
