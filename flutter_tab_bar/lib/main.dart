import 'package:flutter/material.dart';

import 'pages/root/index_root_page.dart';
import 'pages/root/page_root_page.dart';
import 'pages/root/vertical_index_root_page.dart';
import 'pages/root/vertical_page_root_page.dart';

void main() {
  runApp(const SelectPage());
}

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectWidget(),
    );
  }
}

class SelectWidget extends StatelessWidget {
  const SelectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('选项卡页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSelectItem(context, "indexStack", const IndexRootPage()),
            _buildSelectItem(
                context, "verticalIndexStack", const VerticalIndexRootPage()),
            _buildSelectItem(context, "page", const PageRootPage()),
            _buildSelectItem(
                context, "verticalPageTab", const VerticalPageRootPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectItem(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => page));
      },
      child: Text(title),
    );
  }
}
