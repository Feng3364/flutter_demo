import 'package:flutter/material.dart';
import 'package:flutter_main_page/widget/tab_navigator.dart';

import '../../route/route_name.dart';
import '../../widget/keep_alive_wrapper.dart';

/*
* 优点：页面展示时才会初始化
* 缺点：需要使用 AutomaticKeepAliveClientMixin 保持状态，因此tabBar页只能使用 StatefulWidget
* (这里封装了KeepAliveWrapper进行了页面保活，可参考 PageSessionPage)
* */
class PageRootPage extends StatefulWidget {
  const PageRootPage({Key? key}) : super(key: key);

  @override
  PageRootPageState createState() => PageRootPageState();
}

class PageRootPageState extends State<PageRootPage> {
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  final List<Widget> _pages = [
    const KeepAliveWrapper(child: TabNavigator(initial: RouteName.session)),
    const KeepAliveWrapper(child: TabNavigator(initial: RouteName.contacts)),
    const KeepAliveWrapper(child: TabNavigator(initial: RouteName.mine)),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: PageView(
          // 拒绝滚动
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blueAccent,
          currentIndex: _currentIndex,
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
              _currentIndex = index;
            });
            _controller.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
