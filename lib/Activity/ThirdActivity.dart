import 'package:flutter/material.dart';

class ThirdActivity extends StatefulWidget {
  const ThirdActivity({Key key}) : super(key: key);

  @override
  _ThirdActivityState createState() => _ThirdActivityState();
}

class _ThirdActivityState extends State<ThirdActivity> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onVerticalDragStart:(df){
          Navigator.pop(context);
        },child: Scaffold(
      backgroundColor: Colors.white,
    ));
  }
}
