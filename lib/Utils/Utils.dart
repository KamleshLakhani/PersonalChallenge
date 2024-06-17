import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils{
  static Color black = Colors.black;
  static Color purple = Color(0xFF5E51FF);
  static Color darkpurple = Color(0xFF4638F2);
  static Color pink = Color(0xFFCAC1E9);
  static Color lightpink = Color(0xFFB4A5C2);
  static Color white = Color(0xFFffffff);
  static Color skyblue = Color(0xFFC9D4FF);
  static getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static text(String text,var size,Color color){
    return Text(text,style: GoogleFonts.bebasNeue(fontSize: size,color: color));
  }
  static txtstyl(size,color){
    return GoogleFonts.bebasNeue(fontSize: size,color: color);
  }
}