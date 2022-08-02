import 'package:flutter/material.dart';
import 'package:flutter_main_page/route/route_name.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Felix'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: TextButton(
          child: const Text('Felix的名片'),
          onPressed: () {
            Navigator.of(context).pushNamed(RouteName.card);
          },
        ),
      ),
    );
  }
}
