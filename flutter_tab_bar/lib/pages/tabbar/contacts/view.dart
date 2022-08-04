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
      body: ListView.builder(
        itemCount: 20,
        controller: ScrollController(),
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            // onPressed: () {
            //   Navigator.of(context).pushNamed(RouteName.card, arguments: {
            //     "userId": index.toString(),
            //     "username": "冯$index",
            //   });
            // },
            onPressed: () => logic.pushCardPage(index),
            child: Column(
              children: [
                Container(
                  height: 50,
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
        },
      ),
    );
  }
}
