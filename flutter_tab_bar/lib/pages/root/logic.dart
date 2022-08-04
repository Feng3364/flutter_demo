import 'package:get/get.dart';

import 'state.dart';

class RootLogic extends GetxController {
  final RootState state = RootState();

  ///切换tab
  void switchTabBar(int index) {
    state.selectedIndex = index;
    state.pageController.jumpToPage(index);
    update();
  }

  ///是否展开侧边栏
  void onUnfold(bool isUnfold) {
    state.isUnfold = !state.isUnfold;
    update();
  }
}
