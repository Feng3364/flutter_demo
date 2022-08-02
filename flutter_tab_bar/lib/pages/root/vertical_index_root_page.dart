import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widget/tab_navigator.dart';
import '../tabbar/contacts_page.dart';
import '../tabbar/mine_page.dart';
import '../tabbar/session_page.dart';

/*
* IndexRootPage的思路
* 暂用自定义组件+Divider当tabBar，可重写BottomNavigationBar
* */
class VerticalIndexRootPage extends StatefulWidget {
  const VerticalIndexRootPage({Key? key}) : super(key: key);

  @override
  VerticalIndexRootPageState createState() => VerticalIndexRootPageState();
}

class VerticalIndexRootPageState extends State<VerticalIndexRootPage> {
  int _currentIndex = 0;
  final List<Widget> _items = [
    const TabNavigator(child: SessionPage()),
    const TabNavigator(child: ContactsPage()),
    const TabNavigator(child: MinePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: Row(
          children: [
            _buildTabBarWidget(),
            const VerticalDivider(color: Colors.grey, width: 1, thickness: 1),
            _buildIndexStack(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarWidget() {
    return SizedBox(
      width: 65,
      height: double.infinity,
      child: Column(
        children: [
          _buildTabBarItem("首页", Icons.home_outlined, 0),
          _buildTabBarItem("通讯录", Icons.phone, 1),
          _buildTabBarItem("我的", Icons.person, 2),
        ],
      ),
    );
    // return SizedBox(
    //   width: 65,
    //   height: double.infinity,
    //   child: BottomNavigationBar(
    //     iconSize: 24,
    //     type: BottomNavigationBarType.fixed,
    //     fixedColor: Colors.blueAccent,
    //     currentIndex: _currentIndex,
    //     selectedFontSize: 10,
    //     unselectedFontSize: 10,
    //     items: const [
    //       BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "首页"),
    //       BottomNavigationBarItem(icon: Icon(Icons.phone), label: "通讯录"),
    //       BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
    //     ],
    //     onTap: (index) {
    //       setState(() {
    //         _currentIndex = index;
    //       });
    //       _controller.jumpToPage(index);
    //     },
    //   ),
    // );
  }

  Widget _buildTabBarItem(String title, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Column(
          children: [Icon(icon), Text(title)],
        ),
      ),
    );
  }

  Widget _buildIndexStack() {
    return Expanded(
      child: IndexedStack(
        index: _currentIndex,
        children: _items,
      ),
    );
  }
}
