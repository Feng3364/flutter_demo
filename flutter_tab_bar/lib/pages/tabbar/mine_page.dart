import 'package:flutter/material.dart';

import '../../route/route_name.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('个人中心');
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: TextButton(
          child: const Text('退出登录'),
          onPressed: () {
            final ScaffoldState state =
                context.findRootAncestorStateOfType<ScaffoldState>()!;
            Navigator.of(state.context)
                .pushNamedAndRemoveUntil(RouteName.login, (route) => false);
          },
        ),
      ),
    );
  }
}
