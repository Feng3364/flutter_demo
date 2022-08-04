import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/tabbar/mine/setting/logic.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final SettingLogic logic = SettingLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置中心"),
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
