import 'package:flutter/material.dart';
import 'package:flutter_main_page/pages/root/state.dart';
import 'package:flutter_main_page/widget/business/side_navigation.dart';
import 'package:get/get.dart';

import 'logic.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final RootLogic logic = Get.put(RootLogic());
  final RootState state = Get.find<RootLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(children: [
        ///侧边栏区域
        GetBuilder<RootLogic>(
          builder: (logic) {
            return SideNavigation(
              selectedIndex: state.selectedIndex,
              isUnfold: state.isUnfold,
              sideItems: state.itemList,
              //点击item
              onItem: (index) => logic.switchTap(index),
              //展开侧边栏
              onUnfold: (isUnfold) => logic.onUnfold(isUnfold),
            );
          },
        ),

        ///Expanded占满剩下的空间
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.pageList.length,
            itemBuilder: (context, index) => state.pageList[index],
            controller: state.pageController,
          ),
        )
      ]),
    );
  }
}
