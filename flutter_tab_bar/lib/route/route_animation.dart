import 'package:flutter/cupertino.dart';
import 'package:flutter_main_page/route/route_name.dart';

///
/// ios风格的路由切换，从左到右
///
class CupertinoPageBuilder extends CupertinoPageRoute {
  final Widget page;

  CupertinoPageBuilder(this.page, {RouteSettings? settings})
      : super(
          settings: settings,
          builder: (_) => page,
        );
}

///
/// TabBar切换
///
class TabBarRoute {
  static switchTo(BuildContext context, String pageName) {
    var state = context.findAncestorWidgetOfExactType<PageView>();
    if (pageName == RouteName.session) {
      state?.controller.jumpToPage(0);
    } else if (pageName == RouteName.contacts) {
      state?.controller.jumpToPage(1);
    } else if (pageName == RouteName.mine) {
      state?.controller.jumpToPage(2);
    }
  }
}

///
/// 半页面的路由切换
///
class HalfPageBuilder extends PageRouteBuilder {
  final Widget page;

  HalfPageBuilder(this.page, {RouteSettings? settings})
      : super(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              createTransition(animation, child),
        );

  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
}
