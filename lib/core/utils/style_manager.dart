import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fonts_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    // fontFamily: AppFonts.urwDinArabic,
    color: color,
    fontWeight: fontWeight,
  );
}

// regular style

TextStyle getRegularStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
    fontSize ?? FontSize.s16.spMin,
    AppFontsWeight.regular,
    color,
  );
}

// medium style

TextStyle getMediumStyle({double? fontSize, Color? color}) {
  return _getTextStyle(
    fontSize ?? FontSize.s16.spMin,
    AppFontsWeight.medium,
    color ?? Colors.black,
  );
}
