import 'package:flutter/material.dart';

class StateManagerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SMDState();
  }
}

class _SMDState extends State<StateManagerDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("state msg demo")),
      body: Center(child: Chip(label: Text("$count"),),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            count += 1;
            print("count = $count");
          });
        },
      ),
    );
  }
}
