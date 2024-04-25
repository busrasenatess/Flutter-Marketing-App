import 'package:flutter/material.dart';
//TODO: SINGLETON DESIGN PATTERN

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants? get instance {
    _instance ??= ColorConstants._init();
    return _instance;
  }

  ColorConstants._init();
  final Color mainColor = const Color(0xff263262);
  final Color cadetBlue = const Color(0xffB5B8C7);
  final Color alabaster = const Color(0xffFAFAFA);
}
