import 'package:flutter/material.dart';
import 'package:wechatdemo/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  Widget headerWidget() {
    return Container(
      color: Colors.white,
      height: 200,
      child: Container(
        color: Colors.yellow,
        margin: EdgeInsets.only(top: 100, bottom: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  ))), // 列表
          Container(
            color: Color.fromRGBO(0, 0, 0, 0),
            height: 25,
            margin: EdgeInsets.only(top: 40, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Image(image: AssetImage("images/相机.png"))],
            ),
          ), // 相机按钮
        ],
      ),
    );
  }
}
