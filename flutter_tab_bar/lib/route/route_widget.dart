import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/children/card_page.dart';
import 'package:flutter_main_page/pages/children/chat_page.dart';
import 'package:flutter_main_page/pages/children/detail_page.dart';
import 'package:flutter_main_page/pages/choice/login_page.dart';
import 'package:flutter_main_page/pages/choice/not_found_page.dart';
import 'package:flutter_main_page/pages/tabbar/contacts_page.dart';
import 'package:flutter_main_page/pages/tabbar/mine_page.dart';
import 'package:flutter_main_page/pages/tabbar/session_page.dart';
import 'package:flutter_main_page/route/route_animation.dart';

import '../pages/choice/vertical_page_root_page.dart';
import 'route_name.dart';

class RouteWidget {
  static Route<dynamic> init(RouteSettings settings) {
    Widget page = const NotFoundPage();
    switch (settings.name) {

      /// choice
      case RouteName.login:
        page = const LoginPage();
        break;

      case RouteName.root:
        page = const VerticalPageRootPage();
        break;

      /// tabBar
      case RouteName.session:
        page = const SessionPage();
        break;

      case RouteName.contacts:
        page = const ContactsPage();
        break;

      case RouteName.mine:
        page = const MinePage();
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
