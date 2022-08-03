import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ContactsPage extends StatelessWidget {
  ContactsPage({super.key});
  final logic = Get.put(ContactsLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通讯录'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text('跳转会话页'),
              onPressed: () => logic.switchSessionPage(),
            ),
            TextButton(
              child: const Text('跳转详情'),
              onPressed: () => logic.pushDetailPage(),
            ),
          ],
        ),
      ),
    );
  }
}
