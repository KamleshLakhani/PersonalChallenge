import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personalchallenge/Utils/Utils.dart';

class FADetailedActivity extends StatefulWidget {
  final String name;
  final String image;
  final String date;
  final String herotag;

  FADetailedActivity({this.herotag, this.date, this.name, this.image, Key key})
      : super(key: key);

  @override
  _FADetailedActivityState createState() => _FADetailedActivityState();
}

class _FADetailedActivityState extends State<FADetailedActivity> {
  bool isExpanded = false;
  bool isExpanded1 = false;
  bool isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    var screenwidth = Utils.getWidth(context);
    var screenheight = Utils.getHeight(context);
    return Scaffold(
      backgroundColor: Utils.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
              tag: widget.herotag,
              child: Image.network(
                widget.image,
                width: screenwidth,
                height: screenheight * .9,
                fit: BoxFit.cover,
              )),
          Positioned(
              top: screenheight * .05,
              left: screenwidth * .03,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,
                          size: 25.0, color: Utils.white)),
                  SizedBox(height: 25.0),
                  DelayedDisplay(
                      delay: Duration(milliseconds: 50),
                      fadeIn: true,
                      child: Container(
                          width: screenwidth * .65,
                          child: Text(widget.name,
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 80.0,
                                  color: Utils.white,
                                  height: 0.8),
                              textAlign: TextAlign.start)))
                ],
              )),
          //black Container
          Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragStart: (df){
                  setState(() {
                    isExpanded2 =! isExpanded2;
                  });
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
                    // transform: (isExpanded || isExpanded1
                    //     ? (Matrix4.identity()
                    //   ..translate(0.25 * screenwidth, 0.25 * screenheight)// translate towards right and down
                    //   ..scale(0.95, 0.95))// scale with to 95% anchorred at topleft of the AnimatedContainer
                    //     : Matrix4.identity()),
                    height: isExpanded2 ? screenheight*.68 :screenheight * .23,
                    width: isExpanded2 ? screenwidth :screenwidth * .8,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        color: Utils.black,
                        borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(isExpanded2 ? 0.0 :50.0))),
                child: Row(
                  children: [
                    Expanded(flex: 2,child: Column(
                      children: [
                      Text('New Group Starts',style: TextStyle(color: Utils.purple,fontSize: 12.0)),
                      SizedBox(height: 5),
                      Utils.text('01.02.2020',30.0,Utils.white),
                    ],)),
                    Expanded(flex: 1,child: Column(
                      children: [
                        Text('Days',style: TextStyle(color: Utils.purple,fontSize: 12.0)),
                        SizedBox(height: 5),
                        Utils.text('28',30.0,Utils.white),
                      ],)),
                    Expanded(flex: 1,child: Column(
                      children: [
                        Text('Participants',style: TextStyle(color: Utils.purple,fontSize: 12.0),overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 5),
                        Utils.text('15',30.0,Utils.white),
                      ],))
                  ],
                ),),
              )),
          //purple Container
          Positioned(
              bottom: 0,
              left: 0,
              child: AnimatedContainer(
                alignment: Alignment.center,
                  // transform: (isExpanded1 || isExpanded2
                  //     ? (Matrix4.identity()
                  //   ..translate(-0.25 * screenwidth, 0.25 * screenheight)// translate towards right and down
                  //   ..scale(-0.95, 0.95))// scale with to 95% anchorred at topleft of the AnimatedContainer
                  //     : Matrix4.identity()),
                  height: isExpanded2 ? screenheight*.57 :screenheight * .13,
                  width: isExpanded2 ? screenwidth :screenwidth * .6,
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      color: Utils.purple,
                      borderRadius:
                      BorderRadius.only(topRight: Radius.circular(isExpanded ? 0.0 :50.0))),
                child: Utils.text('About Challenges', 25.0, Utils.white),)),
          //white Container
          Positioned(
              bottom: 0,
              right: 0,
              child: AnimatedContainer(
                alignment: Alignment.center,
                  // transform: (isExpanded || isExpanded2
                  //     ? (Matrix4.identity()
                  //   ..translate(0.25 * screenwidth, 0.25 * screenheight)// translate towards right and down
                  //   ..scale(0.95, 0.95))// scale with to 95% anchorred at topleft of the AnimatedContainer
                  //     : Matrix4.identity()),
                  height: isExpanded1 ? screenheight :screenheight * .1,
                  width: isExpanded1 ? screenwidth :screenwidth * .43,
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Utils.black.withOpacity(.5),offset: Offset(1.0,0.0),blurRadius: 10.0,spreadRadius: 1.0)],
                      color: Utils.white,
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(isExpanded1 ? 0.0 :50.0))),
              child: Utils.text('BOOK \$12', 25.0, Color(0xFFC48FA0)),)),

        ],
      ),
    );
  }
}
