import 'package:flutter/material.dart';

import '../../widget/tab_navigator.dart';
import '../child/chat_page.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('聊天页');

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
        itemBuilder: (BuildContext context, int index) {
          return Column(
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
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _buildChatWidget() {
    return Expanded(
      //PageView能阻挡导航栏穿透左侧列表（暂时没有更好的解决办法）
      child: PageView(
        children: const [
          TabNavigator(
            child: ChatPage(),
          ),
        ],
      ),
    );
  }
}
