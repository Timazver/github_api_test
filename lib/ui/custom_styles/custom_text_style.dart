import 'package:flutter/material.dart';

class CustomTextStyle extends TextStyle {
  final Color colour;
  static const FontWeight textFontWeight = FontWeight.normal;
  static const String textFontFamily = "Roboto";
  final double textFontSize;

  const CustomTextStyle({this.textFontSize, this.colour}):super(color:colour, fontSize: textFontSize, fontWeight:textFontWeight, fontFamily:textFontFamily);
}
