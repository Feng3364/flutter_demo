import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginLogic logic = Get.put(LoginLogic());

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => logic.login(),
      child: const Text("登录"),
    );
  }
}
