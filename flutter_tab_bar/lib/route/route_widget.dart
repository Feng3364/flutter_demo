import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/children/card_page.dart';
import 'package:flutter_main_page/pages/children/chat_page.dart';
import 'package:flutter_main_page/pages/children/detail_page.dart';
import 'package:flutter_main_page/pages/root/view.dart';
import 'package:flutter_main_page/route/route_animation.dart';

import '../pages/login/view.dart';
import '../pages/not_found_page.dart';
import '../pages/tabbar/contacts/view.dart';
import '../pages/tabbar/mine/view.dart';
import '../pages/tabbar/session/view.dart';
import 'route_name.dart';

class RouteWidget {
  static Route<dynamic> init(RouteSettings settings) {
    Widget page = NotFoundPage();
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
        page = const ChatPage();
        break;

      case RouteName.detail:
        page = const DetailPage();
        break;

      case RouteName.card:
        return HalfPageBuilder(const CardPage());

      default:
        break;
    }
    return CupertinoPageBuilder(page, settings: settings);
  }
}
