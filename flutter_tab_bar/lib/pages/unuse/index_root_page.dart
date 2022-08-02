import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_main_page/widget/tab_navigator.dart';

import '../../route/route_name.dart';

/*
* 优点：tabBar页可以使用 StatelessWidget
* 缺点：一进来要build所有tabBar页
* */
class IndexRootPage extends StatefulWidget {
  const IndexRootPage({Key? key}) : super(key: key);

  @override
  IndexRootPageState createState() => IndexRootPageState();
}

class IndexRootPageState extends State<IndexRootPage> {
  int currentIndex = 0;
  final List<Widget> _items = [
    const TabNavigator(initial: RouteName.session),
    const TabNavigator(initial: RouteName.contacts),
    const TabNavigator(initial: RouteName.mine),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: _items,
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blueAccent,
          currentIndex: currentIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: "通讯录"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
