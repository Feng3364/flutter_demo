import 'package:flutter/material.dart';
import 'package:flutter_main_page/route/route_name.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteName.root, (route) => false);
      },
      child: const Text("登录"),
    );
  }
}
