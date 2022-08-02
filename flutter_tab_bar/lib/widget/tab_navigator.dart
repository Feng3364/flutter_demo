import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  final Widget child;
  const TabNavigator({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
