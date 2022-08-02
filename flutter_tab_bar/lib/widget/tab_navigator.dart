import 'package:flutter/material.dart';
import 'package:flutter_main_page/route/route_widget.dart';

class TabNavigator extends StatelessWidget {
  final String initial;
  const TabNavigator({Key? key, required this.initial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: initial,
      onGenerateRoute: RouteWidget.init,
    );
  }
}
