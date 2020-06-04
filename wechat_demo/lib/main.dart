import 'package:flutter/material.dart';
import 'package:wechatdemo/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 长按颜色
        highlightColor: Color.fromRGBO(0, 0, 0, 0),
        // 点击颜色
        splashColor: Color.fromRGBO(0, 0, 0, 0),
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
