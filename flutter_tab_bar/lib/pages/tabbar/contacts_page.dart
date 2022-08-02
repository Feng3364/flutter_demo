import 'package:flutter/material.dart';
import 'package:flutter_main_page/route/route_name.dart';

import '../../route/route_animation.dart';
import '../children/detail_page.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('通讯录');
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
              onPressed: () => TabBarRoute.switchTo(context, RouteName.session),
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
