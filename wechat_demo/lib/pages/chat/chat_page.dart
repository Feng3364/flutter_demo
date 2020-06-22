import 'package:flutter/material.dart';
import 'package:wechatdemo/pages/chat/chat_model.dart';
import 'package:wechatdemo/tools/http_manager.dart' as http;

import '../../const.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Chat> _datas = [];
  void initState() {
    super.initState();
    print("Chat的init来了");
    getDatas().then((List<Chat> datas) {
      setState(() {
        _datas = datas;
      });
    }).catchError((e) {
      print(e);
    }).whenComplete(() {
      print("网络请求结束");
    });
  }

  Widget _buildPopupMenuItem(String image, String title) {
    return Row(children: <Widget>[
      Image(image: AssetImage(image), width: 20),
      SizedBox(width: 20),
      Text(title, style: TextStyle(color: Colors.white)),
    ]);
  }

  /// 异步网络请求
  Future<List<Chat>> getDatas() async {
    final response = await http.get(
        "http://rap2.taobao.org:38080/app/mock/257810/api/chat/list",
        timeOut: 100);
    if (response.statusCode == 200) {
      List<Chat> chatList = response.data["chat_list"]
          .map<Chat>((item) => Chat.fromJson(item))
          .toList();
      return chatList;
    } else {
      throw Exception("statusCode:${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("微信"),
          backgroundColor: AppThemeColor,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: PopupMenuButton(
                offset: Offset(0, 60),
                child: Image(
                  image: AssetImage("images/圆加.png"),
                  width: 25,
                ),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<String>>[
                    PopupMenuItem(
                        child: _buildPopupMenuItem("images/发起群聊.png", "发起群聊")),
                    PopupMenuItem(
                        child: _buildPopupMenuItem("images/添加朋友.png", "添加朋友")),
                    PopupMenuItem(
                        child: _buildPopupMenuItem("images/扫一扫1.png", "扫一扫")),
                    PopupMenuItem(
                        child: _buildPopupMenuItem("images/收付款.png", "收付款")),
                  ];
                },
              ),
            )
          ],
        ),
        body: Container(
            child: _datas.length == 0
                ? Center(child: Text("Loading..."))
                : ListView.builder(
                    itemCount: _datas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(_datas[index].name),
                        subtitle: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(right: 10),
                          height: 25,
                          child: Text(
                            _datas[index].message,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(_datas[index].imageUrl),
                        ),
                      );
                    },
                  )));
  }
}
