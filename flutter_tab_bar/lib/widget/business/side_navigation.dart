import 'package:flutter/material.dart';

///回调一个参数
typedef ParamSingleCallback<D> = dynamic Function(D data);

class SideNavigation extends StatelessWidget {
  const SideNavigation({
    super.key,
    required this.onItem,
    required this.selectedIndex,
    required this.sideItems,
    required this.isUnfold,
    required this.onUnfold,
  });

  ///侧边栏item
  final List sideItems;

  ///选择的index
  final int selectedIndex;
  final ParamSingleCallback onItem;

  ///是否展开  点击展开事件
  final bool isUnfold;
  final ParamSingleCallback<bool> onUnfold;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Colors.white,
      //阴影Z轴高度
      elevation: 3,
      extended: isUnfold,
      labelType: isUnfold
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.selected,
      //侧边栏中的item
      destinations: sideItems.map((item) => _buildItem(item)).toList(),
      //顶部头像
      leading: _buildTopHead(),
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) => onItem(index),
    );
  }

  Widget _buildTopHead() {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      ),
    );
  }

  NavigationRailDestination _buildItem(item) {
    return NavigationRailDestination(
      icon: item.icon,
      label: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          item.title,
        ),
      ),
    );
  }
}
