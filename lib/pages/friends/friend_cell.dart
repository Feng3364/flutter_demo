import 'package:flutter/material.dart';
import 'package:wechatdemo/const.dart';

class FriendsCell extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;

  const FriendsCell({
    required this.name,
    this.imageUrl,
    this.groupTitle = "",
    this.imageAssets = "",
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider assetProvider = AssetImage(imageAssets);
    return Column(
      children: <Widget>[
        // 字母
        Container(
          margin: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          height: groupTitle.isEmpty ? 0 : 30,
          color: Color.fromRGBO(1, 1, 1, 0),
          child: groupTitle.isEmpty
              ? null
              : Text(groupTitle, style: TextStyle(color: Colors.grey)),
        ),
        // cell
        Container(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: imageUrl != null
                          ? NetworkImage(imageUrl!)
                          : assetProvider,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
        // 分割线
        Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 30),
                width: ScreenWidth(context) - 30,
                height: 0.5,
                color: AppThemeColor),
          ],
        ) //分割线
      ],
    );
  }
}
