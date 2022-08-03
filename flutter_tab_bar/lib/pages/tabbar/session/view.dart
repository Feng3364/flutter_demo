import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../children/chat_page.dart';
import 'logic.dart';

class SessionPage extends StatelessWidget {
  final SessionLogic logic = Get.put(SessionLogic());

  SessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildSessionWidget(),
        _buildChatWidget(),
      ],
    );
  }

  Widget _buildSessionWidget() {
    return SizedBox(
      width: 150,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () => logic.switchChatItem(index),
            child: Column(
              children: [
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text('$index'),
                ),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatWidget() {
    //TODO:不隐藏式跳转
    return const Expanded(
      child: ChatPage(),
    );
    // return const Expanded(
    //   child: TabNavigator(
    //     initial: RouteName.chat,
    //   ),
    // );
  }
}
