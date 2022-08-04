import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MinePage extends StatelessWidget {
  MinePage({super.key});

  final MineLogic logic = Get.put(MineLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
      ),
      body: Center(
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              TextButton(
                child: const Text('设置中心'),
                onPressed: () => logic.pushSettingPage(),
              ),
              TextButton(
                child: const Text('退出登录'),
                onPressed: () => logic.loginOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
