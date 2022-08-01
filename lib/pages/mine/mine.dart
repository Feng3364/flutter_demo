import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechatdemo/const.dart';
import 'package:wechatdemo/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  File? _avatarFile;
  MethodChannel _methodChannel = MethodChannel("mine_page");

  @override
  void initState() {
    super.initState();
    // 设置回调
    _methodChannel.setMethodCallHandler((call) {
      if (call.method == "imagePath") {
        String imagePath = call.arguments.toString().substring(7);
        setState(() {
          _avatarFile = File(imagePath);
        });
      }
      return Future(() {});
    });
  }

  Widget headerWidget() {
    ImageProvider assetProvider = AssetImage("images/avatar.png");
    return Container(
      color: Colors.white,
      height: 200,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 100, 20, 10),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // 通信
                _methodChannel.invokeMapMethod("picture");
              },
              // 头像
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: _avatarFile == null
                            ? assetProvider
                            : FileImage(_avatarFile!),
                        fit: BoxFit.cover)),
              ),
            ),
            // 其他信息
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              width: ScreenWidth(context) - 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Felix",
                      style: TextStyle(fontSize: 25, color: Colors.black)),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("微信号：Feng",
                            style: TextStyle(fontSize: 13, color: Colors.grey)),
                        Image(
                            image: AssetImage("images/icon_right.png"),
                            width: 15)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(220, 220, 220, 1),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: <Widget>[
                  headerWidget(),
                  SizedBox(height: 10),
                  DiscoverCell(imageName: "images/微信 支付.png", title: "支付"),
                  SizedBox(height: 10),
                  DiscoverCell(imageName: "images/微信收藏.png", title: "收藏"),
                  DiscoverCell(imageName: "images/微信相册.png", title: "相册"),
                  DiscoverCell(imageName: "images/微信卡包.png", title: "卡包"),
                  DiscoverCell(imageName: "images/微信表情.png", title: "表情"),
                  SizedBox(height: 10),
                  DiscoverCell(imageName: "images/微信设置.png", title: "设置"),
                ],
              ),
            ),
          ),
          // 相机按钮
          Container(
            color: Color.fromRGBO(0, 0, 0, 0),
            height: 25,
            margin: EdgeInsets.only(top: 40, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Image(image: AssetImage("images/相机.png"))],
            ),
          ),
        ],
      ),
    );
  }
}
