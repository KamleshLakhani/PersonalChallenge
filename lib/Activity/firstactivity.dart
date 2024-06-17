import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:personalchallenge/Utils/Utils.dart';
import 'package:personalchallenge/components/workoutcontainer.dart';

import 'FADetailed.dart';

class FirstActivity extends StatefulWidget {
  const FirstActivity({Key key}) : super(key: key);
  @override
  _FirstActivityState createState() => _FirstActivityState();
}

class _FirstActivityState extends State<FirstActivity>{
  @override
  Widget build(BuildContext context) {
    var screenwidth = Utils.getWidth(context);
    var screenheight = Utils.getHeight(context);
    return GestureDetector(
        onVerticalDragStart:(df){Navigator.pop(context);},
      child: Scaffold(
        backgroundColor: Utils.black,
        appBar: AppBar(
          backgroundColor: Utils.black,
          automaticallyImplyLeading: false,
          title: Icon(Icons.arrow_back,color: Utils.white),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(tag:'data',child:Material(type: MaterialType.transparency,child:Utils.text('TOP CHALLENGES', 40.0, Color(0xFFA293FB)))),
              SizedBox(height: screenheight*.01),
              Flexible(
                child: DelayedDisplay(
                  delay: Duration(milliseconds: 200),
                  slidingBeginOffset: Offset(0.0,-0.1),
                  fadeIn: true,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),itemCount: datalist.length,
                    itemBuilder: (context, index) =>
                        WorkOutBox(ontap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)
                        => FADetailedActivity(herotag:index.toString(),name: datalist[index]['name'],date: datalist[index]['date'],image: datalist[index]['image'],),)),
                    tag: datalist[index]['tag'],
                      herotag: index.toString(),
                      image: datalist[index]['image'],
                      date: datalist[index]['date'],
                      name: datalist[index]['name'],
                  ),scrollDirection: Axis.vertical),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
List datalist = [
  {
  'image' :'https://img.etimg.com/photo/msid-74747053,quality-100/for-miles-a-great-bodyweight-workout-would-include-squats-push-ups-walking-lunges-.jpg',
  'name' :'Marathon Running Prep',
  'date' :'7-07-2021 \$ 12',
  'tag':'Sports'
},
  {
    'image' :'https://onnitacademy.imgix.net/2016/02/Pull_Up_Alt1-1440x900.jpg',
    'name' :'Hackthon Running Prep',
    'date' :'18-05-2020 \$ 80',
    'tag':'Back'
  },
  {
    'image' :'https://www.bodybuilding.com/images/2021/march/what-is-the-best-5-day-workout-split-header-960x540.jpg',
    'name' :'Group Conference',
    'date' :'31-01-2021 \$ 29',
    'tag':'Conference'
  },
  {
    'image' :'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/newscms/2019_41/3046661/191010-woman-squat-exercise-stock-cs-323p.jpg',
    'name' :'With Current Era',
    'date' :'26-05-2022 \$ 90',
    'tag':'Gymming'
  },
  {
    'image' :'https://assets.entrepreneur.com/content/3x2/2000/20171108215301-GettyImages-512891759.jpeg',
    'name' :'Warm-Up',
    'date' :'28-06-2019',
    'tag':'WorkOut'
  },
];