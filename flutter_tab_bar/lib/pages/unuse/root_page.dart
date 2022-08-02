import 'package:flutter/material.dart';

import '../choice/vertical_page_root_page.dart';
import 'index_root_page.dart';
import 'page_root_page.dart';
import 'vertical_index_root_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

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
