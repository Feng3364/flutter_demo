import 'package:flutter/material.dart';
import 'package:wechatdemo/pages/chat/search_bar.dart';

import 'chat_model.dart';

class SearchPage extends StatefulWidget {
  final List<Chat> datas;
  const SearchPage({this.datas});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Chat> _models = [];

  /// 搜索字符串
  String _searchText = "";

  /// 普通字体
  TextStyle _normalStyle = TextStyle(fontSize: 16, color: Colors.black);

  /// 高亮字体
  TextStyle _highLightStyle = TextStyle(fontSize: 16, color: Colors.green);

  /// 富文本widget
  Widget _title(String name) {
    List<TextSpan> spans = [];
    List<String> strs = name.split(_searchText);
    for (int i = 0; i < strs.length; i++) {
      String str = strs[i];

      spans.add(TextSpan(text: _searchText, style: _highLightStyle));
      spans.add(TextSpan(text: strs[i], style: _normalStyle));
    }
    return RichText(
      text: TextSpan(children: spans),
    );
  }

  void _searchData(String text) {
    // 清空
    _models.clear();
    _searchText = text;
    if (text.length > 0) {
      for (int i = 0; i < widget.datas.length; i++) {
        String name = widget.datas[i].name;
        if (name.contains(text)) {
          _models.add(widget.datas[i]);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SearchBar(onChanged: (text) {
            _searchData(text);
          }),
          Expanded(
            flex: 1,
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: _models.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildCellForRow(index);
                  },
                )),
          )
        ],
      ),
    );
  }

  ListTile _buildCellForRow(int index) {
    return ListTile(
      title: _title(_models[index].name),
      subtitle: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(right: 10),
        height: 25,
        child: Text(
          _models[index].message,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_models[index].imageUrl),
      ),
    );
  }
}
