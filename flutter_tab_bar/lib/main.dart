import 'package:flutter/material.dart';
import 'package:flutter_main_page/route/route_name.dart';
import 'package:flutter_main_page/route/route_widget.dart';

void main() {
  // 假装用SharedPreferences获取值
  bool isLogin = false;
  runApp(MainPage(isLogin));
}

class MainPage extends StatelessWidget {
  final bool isLogin;
  const MainPage(this.isLogin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.login,
      onGenerateRoute: RouteWidget.init,
    );
  }
}
