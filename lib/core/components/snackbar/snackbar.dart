import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../text/custom_text.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbarWidget(BuildContext context,
    {required String message, String? label, bool? isSuccess = true, Color textColor = Colors.white, double? fontSize = 11}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: CustomText(
      message,
      maxLines: 5,
      textAlign: TextAlign.start,
      textStyle: TextStyle(fontSize: fontSize!.sp, fontWeight: FontWeight.w600, color: textColor),
    ),
    action: SnackBarAction(
      label: label ?? "",
      textColor: textColor,
      onPressed: () {},
    ),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    shape: RoundedRectangleBorder(
      borderRadius: context.border.lowBorderRadius,
    ),
    backgroundColor: isSuccess! ? Colors.green : Colors.red,
  ));
}
