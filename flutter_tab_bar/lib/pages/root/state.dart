import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/tabbar/contacts/view.dart';
import 'package:flutter_main_page/pages/tabbar/session/view.dart';

import '../../common/btn_info.dart';
import '../../widget/function/keep_alive_wrapper.dart';
import '../tabbar/mine/view.dart';

class RootState {
  ///选择index
  late int selectedIndex;

  ///PageView页面
  late List<Widget> pageList;
  late PageController pageController;

  ///控制是否展开
  late bool isUnfold;

  ///是否缩放
  late bool isScale;

  ///分类按钮数据源
  late List<BtnInfo> list;

  ///Navigation的item信息
  late List<BtnInfo> itemList;

  RootState() {
    //初始化index
    selectedIndex = 0;
    //PageView页面
    pageList = [
      KeepAliveWrapper(
        child: SessionPage(),
      ),
      KeepAliveWrapper(
        child: ContactsPage(),
      ),
      const KeepAliveWrapper(
        child: MinePage(),
      ),
    ];
    //页面控制器
    pageController = PageController();
    //默认不展开
    isUnfold = false;
    //默认不缩放
    isScale = false;
    //item栏目
    itemList = [
      BtnInfo(
        title: "聊天",
        icon: const Icon(Icons.message),
      ),
      BtnInfo(
        title: "通讯录",
        icon: const Icon(Icons.book),
      ),
      BtnInfo(
        title: "我的",
        icon: const Icon(Icons.person),
      ),
    ];
  }
}
