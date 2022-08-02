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
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return const CardPage();
              },
              transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child,
              ) {
                return createTransition(animation, child);
              },
            ));
          },
        ),
      ),
    );
  }

  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
}
