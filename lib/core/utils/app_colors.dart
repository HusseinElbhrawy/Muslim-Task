import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  static const AppColors _instance = AppColors._();
  factory AppColors() => _instance;

  static const Color scaffoldBgColor = Color(0xffF9F9F9);
  static const Color appBarBGColor = Color(0xff01807E);
  static const Color hintColor = Color(0xff636363);
  static const Color black = Colors.black;
  static const Color blue = Colors.blue;
  static const Color error = Colors.red;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
}
