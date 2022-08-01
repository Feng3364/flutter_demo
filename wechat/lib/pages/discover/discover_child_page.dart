import 'package:flutter/material.dart';
import 'package:wechatdemo/const.dart';

class DiscoverChildPage extends StatelessWidget {
  final String title;
  DiscoverChildPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
        backgroundColor: AppThemeColor,
      ),
    );
  }
}
