import 'package:flutter/material.dart';
import 'package:flutter_main_page/route/route_name.dart';
import 'package:get/get.dart';

import 'route/route_page.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 假装用SharedPreferences获取值
    bool isLogin = false;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLogin ? RouteName.root : RouteName.login,
      getPages: RoutePages.routes,
    );
  }
}
