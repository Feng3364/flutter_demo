import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MineLogic logic = Get.put(MineLogic());

    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('退出登录'),
          onPressed: () => logic.loginOut(),
        ),
      ),
    );
  }
}
