import 'package:flutter/material.dart';

import '../../main.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('个人中心');
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('退出登录'),
          onPressed: () {
            final ScaffoldState state =
                context.findRootAncestorStateOfType<ScaffoldState>()!;
            // 也可以用pushAndRemoveUntil重置路由
            Navigator.of(state.context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SelectWidget()),
            );
          },
        ),
      ),
    );
  }
}
