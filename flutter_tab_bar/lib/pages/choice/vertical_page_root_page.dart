import 'package:flutter/material.dart';
import 'package:flutter_main_page/route/route_name.dart';
import 'package:flutter_main_page/widget/tab_navigator.dart';

import '../../widget/keep_alive_wrapper.dart';
import '../../widget/left_navigation_bar.dart';

/*
* 类似PageRootPage的思路
* 1.LeftNavigationBar重写于BottomNavigationBar，通过isSpaceEvenly
* 2.也可以自定义tabBar控件里来控制PageView
* */
class VerticalPageRootPage extends StatefulWidget {
  const VerticalPageRootPage({Key? key}) : super(key: key);

  @override
  VerticalPageRootPageState createState() => VerticalPageRootPageState();
}

class VerticalPageRootPageState extends State<VerticalPageRootPage> {
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  final List<Widget> _pages = [
    const KeepAliveWrapper(child: TabNavigator(initial: RouteName.session)),
    const KeepAliveWrapper(child: TabNavigator(initial: RouteName.contacts)),
    const KeepAliveWrapper(child: TabNavigator(initial: RouteName.mine)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildTabBarWidget(),
          const VerticalDivider(width: 1),
          _buildPageView(),
        ],
      ),
    );
  }

  Widget _buildTabBarWidget() {
    // 自定义实现
    return SizedBox(
      width: 65,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildTabBarItem("首页", Icons.home_outlined, 0),
              _buildTabBarItem("通讯录", Icons.phone, 1),
              _buildTabBarItem("我的", Icons.person, 2),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
    // 仿系统实现
    return SizedBox(
      width: 65,
      height: double.infinity,
      child: LeftNavigationBar(
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blueAccent,
        currentIndex: _currentIndex,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        isSpaceEvenly: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "通讯录"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _controller.jumpToPage(index);
        },
      ),
    );
  }

  Widget _buildTabBarItem(String title, IconData icon, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
        _controller.jumpToPage(_currentIndex);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Column(
          children: [Icon(icon), Text(title)],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView(
        // 拒绝滚动
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: _pages,
      ),
    );
  }
}
