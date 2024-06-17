import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:personalchallenge/Utils/Utils.dart';

class WorkOutBox extends StatefulWidget {
  final String image;
  final String name;
  final String date;
  final String tag;
  final VoidCallback ontap;
  final String herotag;
  WorkOutBox({this.herotag,this.ontap,this.image,this.name,this.date,this.tag,Key key}) : super(key: key);

  @override
  _WorkOutBoxState createState() => _WorkOutBoxState();
}

class _WorkOutBoxState extends State<WorkOutBox> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = Utils.getWidth(context);
    var screenheight = Utils.getHeight(context);
    return GestureDetector(
      onTap: widget.ontap,
      child: Hero(
        tag: widget.herotag,
        child: Container(
          margin: EdgeInsets.only(bottom: 15.0),
          padding: EdgeInsets.symmetric(horizontal: screenwidth*.05,vertical: screenheight*.02),
          height: screenheight*.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(fit: BoxFit.fill,
                  image: NetworkImage(widget.image,)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(type: MaterialType.transparency,child: Utils.text(widget.name, 25.0, Utils.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(type: MaterialType.transparency,child:Text(widget.date,style: TextStyle(color: Utils.white,fontSize: 15.0))),
                  Container(padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 02.0),decoration: BoxDecoration(color: Utils.white,borderRadius: BorderRadius.circular(30.0)),
                      child:Material(type: MaterialType.transparency,child: Utils.text(widget.tag,18.0,Utils.purple)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
