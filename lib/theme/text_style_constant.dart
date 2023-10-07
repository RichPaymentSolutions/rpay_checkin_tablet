import 'package:flutter/material.dart';

class TextStyleConstant {
  static const livvic = 'Livvic';

  static TextStyle livvicW500({
    double fontSize = 14,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: livvic,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
}
