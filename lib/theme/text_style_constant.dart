import 'package:flutter/material.dart';
import 'package:rp_checkin/theme/color_constant.dart';

class TextStyleConstant {
  static const livvic = 'Livvic';
  static const publicSans = 'PublicSans';

  static TextStyle livvicW500({
    double fontSize = 14,
    Color color = ColorConstant.heading,
  }) {
    return TextStyle(
      fontFamily: livvic,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle livvicW600({
    double fontSize = 14,
    Color color = ColorConstant.heading,
  }) {
    return TextStyle(
      fontFamily: livvic,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle livvicW400({
    double fontSize = 14,
    Color color = ColorConstant.heading,
  }) {
    return TextStyle(
      fontFamily: livvic,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle publicSansW600({
    double fontSize = 14,
    Color color = ColorConstant.heading,
  }) {
    return TextStyle(
      fontFamily: publicSans,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle publicSansW700({
    double fontSize = 14,
    Color color = ColorConstant.heading,
  }) {
    return TextStyle(
      fontFamily: publicSans,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle publicSansW400({
    double fontSize = 14,
    Color color = ColorConstant.heading,
  }) {
    return TextStyle(
      fontFamily: publicSans,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle publicSansW500({
    double fontSize = 14,
    Color color = ColorConstant.heading,
  }) {
    return TextStyle(
      fontFamily: publicSans,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
}
