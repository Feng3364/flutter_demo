import 'package:flutter/material.dart';

import '../../const.dart';

class IndexBar extends StatefulWidget {
  final void Function(String str) indexBarCallBack;

  const IndexBar({this.indexBarCallBack});

  @override
  _IndexBarState createState() => _IndexBarState();
}

int getIndex(BuildContext context, Offset globalPostion) {
  // 拿到box
  RenderBox box = context.findRenderObject();
  // 拿到盒子中对应的y值
  double y = box.globalToLocal(globalPostion).dy;
  // 计算字符高度
  var itemHeight = ScreenHeight(context) / 2 / INDEX_WORDS.length;
  // 计算当前是第几个index
  int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length - 1);
  return index;
}

class _IndexBarState extends State<IndexBar> {
  bool _isDraging = false;
  double _indicatorY = 0.0;
  String _indicatorText = "A";

  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(Expanded(
          child: Text(
        INDEX_WORDS[i],
        style: TextStyle(
            fontSize: 10, color: _isDraging ? Colors.white : Colors.grey),
      )));
    }

    return Positioned(
      right: 0.0,
      height: ScreenHeight(context) / 2,
      top: ScreenHeight(context) / 8,
      width: 120,
      child: Row(
        children: <Widget>[
          Container(
              alignment: Alignment(0.0, _indicatorY),
              width: 100,
              child: _isDraging
                  ? Stack(
                      alignment: Alignment(-0.2, 0),
                      children: <Widget>[
                        Image(
                          image: AssetImage("images/气泡.png"),
                          width: 60,
                        ),
                        Text(_indicatorText,
                            style: TextStyle(fontSize: 25, color: Colors.white))
                      ],
                    )
                  : null),
          GestureDetector(
            child: Container(
              color: Color.fromRGBO(1, 1, 1, _isDraging ? 0.5 : 0),
              child: Column(children: words),
            ),
            onVerticalDragUpdate: (DragUpdateDetails details) {
              int index = getIndex(context, details.globalPosition);
              widget.indexBarCallBack(INDEX_WORDS[index]);
              setState(() {
                _isDraging = true;
                _indicatorText = INDEX_WORDS[index];
                _indicatorY = 2.2 / 28 * index - 1.1;
              });
            },
            onVerticalDragDown: (DragDownDetails details) {
              int index = getIndex(context, details.globalPosition);
              widget.indexBarCallBack(INDEX_WORDS[index]);
              setState(() {
                _isDraging = true;
                _indicatorText = INDEX_WORDS[index];
                _indicatorY = 2.2 / 28 * index - 1.1;
              });
            },
            onVerticalDragEnd: (DragEndDetails details) {
              setState(() {
                _isDraging = false;
              });
            },
          )
        ],
      ),
    );
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
