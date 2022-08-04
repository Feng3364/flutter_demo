import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/root/view.dart';
import 'package:flutter_main_page/pages/tabbar/mine/setting/view.dart';
import 'package:flutter_main_page/route/route_animation.dart';

import '../pages/login/view.dart';
import '../pages/not_found_page.dart';
import '../pages/tabbar/contacts/card/view.dart';
import '../pages/tabbar/contacts/view.dart';
import '../pages/tabbar/mine/view.dart';
import '../pages/tabbar/session/chat/view.dart';
import '../pages/tabbar/session/view.dart';
import 'route_name.dart';

class RouteWidget {
  static Route<dynamic> init(RouteSettings settings) {
    Widget page = const NotFoundPage();
    switch (settings.name) {

      /// choice
      case RouteName.login:
        page = LoginPage();
        break;

      case RouteName.root:
        page = RootPage();
        break;

      /// tabBar
      case RouteName.session:
        page = SessionPage();
        break;

      case RouteName.contacts:
        page = ContactsPage();
        break;

      case RouteName.mine:
        page = MinePage();
        break;

      /// children
      case RouteName.chat:
        page = ChatPage();
        break;

      case RouteName.card:
        return HalfPageBuilder(CardPage());

      case RouteName.setting:
        page = SettingPage();
        break;

      default:
        break;
    }
    return CupertinoPageBuilder(page, settings: settings);
  }
}
