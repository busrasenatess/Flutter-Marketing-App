import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app/color_constants.dart';
//TODO: SINGLETON DESIGN PATTERN

class AppTextTheme {
  static AppTextTheme? _instance;
  static AppTextTheme? get instance {
    _instance ??= AppTextTheme._init();
    return _instance;
  }

  AppTextTheme._init();

  static TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.nunito(fontSize: 50.sp, fontWeight: FontWeight.w900, color: ColorConstants.instance?.mainColor),
    headline2: GoogleFonts.nunito(fontSize: 45.sp, fontWeight: FontWeight.w900, color: ColorConstants.instance?.mainColor),
    headline3: GoogleFonts.nunito(fontSize: 40.sp, fontWeight: FontWeight.w900, color: ColorConstants.instance?.mainColor),
    headline4: GoogleFonts.nunito(fontSize: 25.sp, fontWeight: FontWeight.w700, color: ColorConstants.instance?.mainColor),
    headline5: GoogleFonts.nunito(fontSize: 15.sp, fontWeight: FontWeight.w700, color: ColorConstants.instance?.mainColor),
    headline6: GoogleFonts.nunito(fontSize: 11.sp, fontWeight: FontWeight.w700, color: ColorConstants.instance?.mainColor),
    bodyText1: GoogleFonts.nunito(fontSize: 18.sp, fontWeight: FontWeight.w500, color: ColorConstants.instance?.mainColor),
    bodyText2: GoogleFonts.nunito(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorConstants.instance?.mainColor),
    subtitle1: GoogleFonts.nunito(fontSize: 20.sp, fontWeight: FontWeight.w500, color: ColorConstants.instance?.mainColor),
    subtitle2: GoogleFonts.nunito(fontSize: 10.sp, fontWeight: FontWeight.w500, color: ColorConstants.instance?.mainColor),
    caption: GoogleFonts.nunito(fontSize: 10.sp, fontWeight: FontWeight.w500, color: ColorConstants.instance?.mainColor),
  );
}
/*{
  FontWeight.w100: 'Thin',
  FontWeight.w200: 'ExtraLight',
  FontWeight.w300: 'Light',
  FontWeight.w400: 'Regular',
  FontWeight.w500: 'Medium',
  FontWeight.w600: 'SemiBold',
  FontWeight.w700: 'Bold',
  FontWeight.w800: 'ExtraBold',
  FontWeight.w900: 'Black',
} */
