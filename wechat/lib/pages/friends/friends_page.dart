import 'package:flutter/material.dart';
import 'package:wechatdemo/const.dart';
import 'package:wechatdemo/pages/discover/discover_child_page.dart';
import 'package:wechatdemo/pages/friends/friend_cell.dart';
import 'package:wechatdemo/pages/friends/friends_data.dart';

import 'index_bar.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  /// item对应的高度
  final Map _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };

  final List<Friends> _listDatas = [];

  ScrollController? _scrollController;

  /// 初始化函数
  @override
  void initState() {
    super.initState();

    /// 链式语法
    _listDatas
      ..addAll(datas)
      ..addAll(datas);
    // 排序
    _listDatas.sort((Friends a, Friends b) {
      return a.indexLetter.compareTo(b.indexLetter);
    });

    /// 循环计算保存高度
    var _groupOffset = 54.5 * _headerData.length;
    for (int i = 0; i < _listDatas.length; i++) {
      if (i < 1) {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        // 增加头部+cell高度
        _groupOffset += 84.5;
      } else if (_listDatas[i].indexLetter == _listDatas[i - 1].indexLetter) {
        // 增加没有头部的偏移量
        _groupOffset += 54.5;
      } else {
        // 增加有头部的偏移量
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        _groupOffset += 84.5;
      }
    }

    /// 滚动视图
    _scrollController = ScrollController();
  }

  final List<Friends> _headerData = [
    Friends(imageUrl: "images/新的朋友.png", name: "新的朋友"),
    Friends(imageUrl: "images/群聊.png", name: "群聊"),
    Friends(imageUrl: "images/标签.png", name: "标签"),
    Friends(imageUrl: "images/公众号.png", name: "公众号"),
  ];

  Widget _itemForRow(BuildContext context, int index) {
    // 本地cell
    if (index < _headerData.length) {
      return FriendsCell(
        imageAssets: _headerData[index].imageUrl,
        name: _headerData[index].name,
      );
    }

    bool _hiddenIndex = index > _headerData.length &&
        _listDatas[index - 5].indexLetter == _listDatas[index - 4].indexLetter;
    return FriendsCell(
      imageUrl: _listDatas[index - 4].imageUrl,
      name: _listDatas[index - 4].name,
      groupTitle: _hiddenIndex ? "" : _listDatas[index - 4].indexLetter,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeColor,
        title: Text("通讯录"),
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: AssetImage("images/icon_friends_add.png"),
                width: 25,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DiscoverChildPage(title: "添加朋友")));
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          //通讯录
          Container(
            color: AppThemeColor,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _listDatas.length + _headerData.length,
              itemBuilder: _itemForRow,
            ),
          ),
          //索引表
          IndexBar(indexBarCallBack: (String str) {
            if (_groupOffsetMap[str] != null) {
              _scrollController?.animateTo(_groupOffsetMap[str],
                  duration: Duration(microseconds: 100), curve: Curves.easeIn);
            }
          })
        ],
      ),
    );
  }
}
