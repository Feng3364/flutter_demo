import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/child/card_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Felix'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Felix的名片'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const CardPage();
            }));
          },
        ),
      ),
    );
  }
}
