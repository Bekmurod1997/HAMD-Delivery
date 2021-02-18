import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorPalatte {
  static final mainPageColor = Color(0xffF1F4F7);
  static final nextButtonColor = Color(0xffFF2020);
  static final plaseAuthColor = Color(0xffF1F4F7);
  static final orderButtonColor = Color(0xff9F111B);
  static final strongRedColor = Color(0xff9F111B);
  static final blackColor = Colors.black;

  static setStatusBarColor({Color color = const Color(0xffF1F4F7)}) {
    return SystemUiOverlayStyle(
      statusBarColor: Color(0xffF1F4F7),
      statusBarBrightness: Brightness.dark,
    );
  }
}
