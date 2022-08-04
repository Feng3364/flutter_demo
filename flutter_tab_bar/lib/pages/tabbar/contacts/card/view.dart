import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/tabbar/contacts/card/state.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CardPage extends StatelessWidget {
  CardPage({super.key});

  final CardLogic logic = Get.put(CardLogic());
  final CardState state = Get.find<CardLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<CardLogic>(
          builder: (logic) => Text("${state.username}的名片"),
        ),
      ),
      body: Center(
        child: TextButton(
          child: const Text("进入聊天"),
          onPressed: () => logic.enterChatRoom(),
        ),
      ),
    );
  }
}
