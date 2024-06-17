import 'package:flutter/material.dart';
import 'Activity/HomeScreen.dart';
import 'Utils/Utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Challenge',
      theme: ThemeData(
        scaffoldBackgroundColor: Utils.purple,
      ),
      home: HomeScreen(),
    );
  }
}

