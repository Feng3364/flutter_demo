import 'package:flutter/material.dart';

import '../child/detail_page.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('通讯录');
    return Scaffold(
      appBar: AppBar(
        title: const Text('通讯录'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text('跳转会话页'),
              onPressed: () {
                var state = context.findAncestorWidgetOfExactType<PageView>();
                state?.controller.jumpToPage(0);
              },
            ),
            TextButton(
              child: const Text('跳转详情'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const DetailPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
