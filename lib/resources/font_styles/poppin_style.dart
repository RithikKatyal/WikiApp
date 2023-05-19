import 'package:flutter/material.dart';
import 'package:wiki_app/resources/app_colors.dart';

class Poppins {
  Poppins._();

  static TextStyle textStyleDefault({
    required double fontSize,
    Color color = AppColors.black,
    double lineHeight = 1.25,
    double letterSpacing = 1.0,
    required FontWeight fontWeight
  }){
    return TextStyle(
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 18,
      fontFamily:  'Poppins',
      letterSpacing: letterSpacing,
      fontWeight:  fontWeight,
      height: lineHeight,
    );
  }

  static TextStyle textStyleW200(
      {required double fontSize,
        Color color = AppColors.black,
        double lineHeight = 1.25, double letterSpacing = 1.0,}) {
    return TextStyle(
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 18,
      fontFamily:  'Poppins',
      letterSpacing: letterSpacing,
      fontWeight:  FontWeight.w200,
      height: lineHeight,
    );
  }

  static TextStyle textStyleW300(
      {required double fontSize,
        Color color = AppColors.black,
        double lineHeight = 1.25, double letterSpacing = 1.0,}) {
    return TextStyle(
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 18,
      fontFamily:  'Poppins',
      letterSpacing: letterSpacing,
      fontWeight:  FontWeight.w300,
      height: lineHeight,
    );
  }

  static TextStyle textStyleW400(
      {required double fontSize,
        Color color = AppColors.black,
        double lineHeight = 1.25, double letterSpacing = 1.0,}) {
    return TextStyle(
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 18,
      fontFamily:  'Poppins',
      letterSpacing: letterSpacing,
      fontWeight:  FontWeight.w400,
      height: lineHeight,
    );
  }

  static TextStyle textStyleW500(
      {required double fontSize,
        Color color = AppColors.black,
        double lineHeight = 1.25, double letterSpacing = 1.0,}) {
    return TextStyle(
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 18,
      fontFamily:  'Poppins',
      letterSpacing: letterSpacing,
      fontWeight:  FontWeight.w500,
      height: lineHeight,
    );
  }

  static TextStyle textStyleW600(
      {required double fontSize,
        Color color = AppColors.black,
        double lineHeight = 1.25, double letterSpacing = 1.0,}) {
    return TextStyle(
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 18,
      fontFamily:  'Poppins',
      letterSpacing: letterSpacing,
      fontWeight:  FontWeight.w600,
      height: lineHeight,
    );
  }

  static TextStyle textStyleW700(
      {required double fontSize,
        Color color = AppColors.black,
        double lineHeight = 1.25, double letterSpacing = 1.0,}) {
    return TextStyle(
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 18,
      fontFamily:  'Poppins',
      letterSpacing: letterSpacing,
      fontWeight:  FontWeight.w700,
      height: lineHeight,
    );
  }
}