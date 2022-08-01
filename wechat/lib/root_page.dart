import 'package:flutter/material.dart';
import 'package:wechatdemo/pages/chat/chat_page.dart';
import 'package:wechatdemo/pages/discover/discover_page.dart';
import 'package:wechatdemo/pages/friends/friends_page.dart';
import 'package:wechatdemo/pages/mine/mine.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [ChatPage(), FriendsPage(), DiscoverPage(), MinePage()];
  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // 拒绝滚动
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _controller.jumpToPage(index);
          },

          // 选中配置
          selectedFontSize: 12.0,
          currentIndex: _currentIndex,
          fixedColor: Colors.green,
          type: BottomNavigationBarType.fixed,

          // tabbar配置
          items: [
            BottomNavigationBarItem(
                label: "微信",
                icon: Image.asset("images/tabbar_chat.png",
                    height: 20, width: 20),
                activeIcon: Image.asset(
                  "images/tabbar_chat_hl.png",
                  height: 20,
                  width: 20,
                )),
            BottomNavigationBarItem(
                label: "通讯录",
                icon: Image.asset(
                  "images/tabbar_friends.png",
                  height: 20,
                  width: 20,
                ),
                activeIcon: Image.asset(
                  "images/tabbar_friends_hl.png",
                  height: 20,
                  width: 20,
                )),
            BottomNavigationBarItem(
                label: "发现",
                icon: Image.asset(
                  "images/tabbar_discover.png",
                  height: 20,
                  width: 20,
                ),
                activeIcon: Image.asset(
                  "images/tabbar_discover_hl.png",
                  height: 20,
                  width: 20,
                )),
            BottomNavigationBarItem(
                label: "我的",
                icon: Image.asset(
                  "images/tabbar_mine.png",
                  height: 20,
                  width: 20,
                ),
                activeIcon: Image.asset(
                  "images/tabbar_mine_hl.png",
                  height: 20,
                  width: 20,
                )),
          ]),
    );
  }
}
