import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat/view.dart';
import 'logic.dart';
import 'state.dart';

class SessionPage extends StatelessWidget {
  SessionPage({super.key});

  final SessionLogic logic = Get.put(SessionLogic());
  final SessionState state = Get.find<SessionLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SessionLogic>(
      builder: (logic) => Row(
        children: [
          _buildSessionWidget(),
          _buildChatWidget(),
        ],
      ),
    );
  }

  Widget _buildSessionWidget() {
    return SizedBox(
      width: 150,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: _buildListItemWidget,
      ),
    );
  }

  Widget _buildListItemWidget(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => logic.switchChatRoom(index),
      child: Column(
        children: [
          Container(
            height: 50,
            color:
                state.selectedIndex == index ? Colors.grey[400] : Colors.white,
            alignment: Alignment.center,
            child: Text('冯$index'),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildChatWidget() {
    //TODO:不隐藏式跳转
    return Expanded(
      child: ChatPage(),
    );
    // return const Expanded(
    //   child: TabNavigator(
    //     initial: RouteName.chat,
    //   ),
    // );
  }
}
