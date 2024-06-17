import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:personalchallenge/Activity/firstactivity.dart';
import 'package:personalchallenge/Utils/Utils.dart';
import 'package:personalchallenge/components/AnimatedClipRRect.dart';

import 'SecondActivity.dart';
import 'ThirdActivity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  @override
  Widget build(BuildContext context) {
    var screenwidth = Utils.getWidth(context);
    var screenheight = Utils.getHeight(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Utils.pink,
        body: Stack(
          children: [
            AnimatedClipRRect(
              duration: Duration(milliseconds: 300),
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                      isExpanded || isExpanded1 || isExpanded2 ? 0 : 60.0)),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                color: Utils.purple,
                child: Stack(
                  children: [
                    Positioned(
                      top: screenheight * .08,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          AnimatedContainer(
                              curve: Curves.decelerate,
                              duration: Duration(milliseconds: 300),
                              transform: (isExpanded ||
                                      isExpanded1 ||
                                      isExpanded2
                                  ? (Matrix4.identity()
                                    ..translate(
                                        0.0 * screenwidth,
                                        -screenheight *
                                            .1) // translate towards right and down
                                    ..scale(0.95,
                                        0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
                                  : Matrix4.identity()),
                              padding: EdgeInsets.all(10.0),
                              child: Text('SEARCH FOR YOUR NEXT CHALLENGE',
                                  style: GoogleFonts.bebasNeue(
                                      fontSize: 60.0,
                                      color: Utils.white,
                                      height: 0.8),
                                  textAlign: TextAlign.center)),
                          SizedBox(height: screenheight * .02),
                          AnimatedContainer(
                            curve: Curves.decelerate,
                            duration: Duration(milliseconds: 300),
                            transform: (isExpanded || isExpanded1 || isExpanded2
                                ? (Matrix4.identity()
                                  ..translate(0.25 * screenwidth,
                                      0.0) // translate towards right and down
                                  ..scale(0.95,
                                      0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
                                : Matrix4.identity()),
                            child: Stack(
                              overflow: Overflow.visible,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  alignment: Alignment.center,
                                  width: screenwidth * .8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Utils.darkpurple),
                                  height: 40.0,
                                  child: TextField(
                                    decoration: InputDecoration.collapsed(
                                        hintText:
                                            'Enter topic, Trainers, or keywords',
                                        hintStyle: TextStyle(
                                            color: Utils.white,
                                            fontSize: 15.0)),
                                  ),
                                ),
                                Positioned(
                                    bottom: -5,
                                    top: -5,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: Utils.white,
                                      child: Icon(
                                        Icons.search,
                                        size: 25.0,
                                        color: Utils.pink,
                                      ),
                                      radius: 22.0,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: 15.0),
                          AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              transform: (isExpanded ||
                                      isExpanded1 ||
                                      isExpanded2
                                  ? (Matrix4.identity()
                                    ..translate(screenwidth * .2,
                                        0.0) // translate towards right and down
                                    ..scale(0.95,
                                        0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
                                  : Matrix4.identity()),
                              child: Container(
                                  height: 30.0,
                                  child: ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 45.0),
                                    physics: BouncingScrollPhysics(),
                                    itemCount: 15,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Utils.white),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      alignment: Alignment.center,
                                      child: Text('Keyword'),
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: GestureDetector(
                        onVerticalDragStart: (DragDetail) {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                          Future.delayed(Duration(microseconds: 300), () {
                            Navigator.push(
                                    context,
                                    PageTransition(
                                        child: FirstActivity(),
                                        type: PageTransitionType
                                            .fade) /*MaterialPageRoute(builder: (context) => FirstActivity())*/)
                                .then((value) {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            });
                          });
                        },
                        child: AnimatedContainer(
                          padding: EdgeInsets.only(top: 15),
                          transform: (isExpanded1 || isExpanded2
                              ? (Matrix4.identity()
                                ..translate(
                                    -0.25 * screenwidth,
                                    0.25 *
                                        screenheight) // translate towards right and down
                                ..scale(0.95,
                                    0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
                              : Matrix4.identity()),
                          alignment: Alignment.topCenter,
                          child: Hero(
                              tag: 'data',
                              child: Material(
                                  type: MaterialType.transparency,
                                  child: Utils.text('TOP CHALLENGES', 35.0,
                                      Color(0xFFA293FB)))),
                          decoration: BoxDecoration(
                            color: Utils.black,
                            borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(isExpanded ? 0 : 50.0)),
                          ),
                          width: isExpanded ? screenwidth : screenwidth * .8,
                          height: isExpanded ? screenheight * .8 : screenheight / 2.5,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onVerticalDragStart: (DragDetail) {
                          setState(() {
                            isExpanded1 = !isExpanded1;
                          });
                          Future.delayed(Duration(microseconds: 300), () {
                            Navigator.push(
                                    context,
                                    PageTransition(
                                        child: SecondActivity(),
                                        type: PageTransitionType
                                            .fade) /*MaterialPageRoute(builder: (context) => FirstActivity())*/)
                                .then((value) {
                              setState(() {
                                isExpanded1 = !isExpanded1;
                              });
                            });
                          });
                        },
                        child: AnimatedContainer(
                          transform: (isExpanded || isExpanded2
                              ? (Matrix4.identity()
                                ..translate(
                                    0.25 * screenwidth,
                                    0.25 *
                                        screenheight) // translate towards right and down
                                ..scale(0.95,
                                    0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
                              : Matrix4.identity()),
                          decoration: BoxDecoration(
                            color: Utils.darkpurple,
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(isExpanded1 ? 0 : 50.0)),
                          ),
                          width: isExpanded1 ? screenwidth : screenwidth * .75,
                          height:
                              isExpanded1 ? screenheight : screenheight / 3.6,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: GestureDetector(
                        onVerticalDragStart: (DragDetail) {
                          print(DragDetail.localPosition);
                          setState(() {
                            isExpanded2 = !isExpanded2;
                          });
                          Future.delayed(Duration(microseconds: 300), () {
                            Navigator.push(
                                    context,
                                    PageTransition(
                                        child: ThirdActivity(),
                                        type: PageTransitionType
                                            .fade) /*MaterialPageRoute(builder: (context) => FirstActivity())*/)
                                .then((value) {
                              setState(() {
                                isExpanded2 = !isExpanded2;
                              });
                            });
                          });
                        },
                        child: AnimatedContainer(
                          transform: (isExpanded || isExpanded1
                              ? (Matrix4.identity()
                                ..translate(
                                    -0.25 * screenwidth,
                                    0.25 *
                                        screenheight) // translate towards right and down
                                ..scale(0.95,
                                    0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
                              : Matrix4.identity()),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(isExpanded2 ? 0 : 100.0)),
                          ),
                          width: isExpanded2 ? screenwidth : screenwidth * .9,
                          height: isExpanded2 ? screenheight : screenheight / 7,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: screenheight * .02),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Icon(Icons.home_outlined,
                      color: Utils.lightpink, size: 35.0)),
              Expanded(
                  flex: 1,
                  child: Icon(Icons.home_outlined,
                      color: Utils.lightpink, size: 35.0)),
              Expanded(
                  flex: 1,
                  child: Icon(Icons.home_outlined,
                      color: Utils.lightpink, size: 35.0)),
              Expanded(
                  flex: 1,
                  child: Icon(Icons.home_outlined,
                      color: Utils.lightpink, size: 35.0)),
            ],
          ),
        ));
  }
}
