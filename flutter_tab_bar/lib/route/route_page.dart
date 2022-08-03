import 'package:flutter_main_page/pages/children/card_page.dart';
import 'package:flutter_main_page/pages/children/chat_page.dart';
import 'package:flutter_main_page/pages/children/detail_page.dart';
import 'package:flutter_main_page/pages/root/view.dart';
import 'package:flutter_main_page/route/route_name.dart';
import 'package:get/get.dart';

import '../pages/login/view.dart';
import '../pages/tabbar/contacts/view.dart';
import '../pages/tabbar/mine/view.dart';
import '../pages/tabbar/session/view.dart';

class RoutePages {
  static final routes = [
    GetPage(
      name: RouteName.login,
      page: () => LoginPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.root,
      page: () => RootPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.session,
      page: () => SessionPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.contacts,
      page: () => ContactsPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.mine,
      page: () => MinePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.chat,
      page: () => const ChatPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.detail,
      page: () => const DetailPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.card,
      page: () => const CardPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
