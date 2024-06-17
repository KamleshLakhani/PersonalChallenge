import 'package:flutter/material.dart';
import 'package:personalchallenge/Utils/Utils.dart';

class SecondActivity extends StatefulWidget {
  const SecondActivity({Key key}) : super(key: key);

  @override
  _SecondActivityState createState() => _SecondActivityState();
}

class _SecondActivityState extends State<SecondActivity> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart:(df){
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Utils.darkpurple
      ),
    );
  }
}
