import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:marketingapp/core/components/text/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/color_constants.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  late String? text;
  final double? width;
  final double? height;
  final double? radius;
  final Function onTap;
  final Color? iconColor;
  final IconData? icon;
  final double? fontSize;
  final Color? textColor;
  final Color? buttonColor;
  final bool? isBold;
  late Color? borderColor;
  late FontWeight? fontWeight;
  final double? iconSize;
  final bool? isTherePadding;
  final String? path;
  final bool? isThereShadow;
  final bool isLefttIcon;
  ButtonWidget({
    Key? key,
    this.text = "",
    this.width = 0.91,
    this.height = 0.06,
    this.buttonColor,
    required this.onTap,
    this.radius = 0.03,
    this.path,
    this.iconColor,
    this.icon,
    this.fontSize = 13,
    this.textColor = Colors.white,
    this.isBold = true,
    this.borderColor,
    this.fontWeight = FontWeight.bold,
    this.iconSize,
    this.isTherePadding = true,
    this.isThereShadow = true,
    this.isLefttIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isTherePadding == true ? 8.0 : 2),
      child: Container(
        height: context.sized.dynamicHeight(height!),
        width: context.sized.dynamicWidth(width!),
        decoration: BoxDecoration(
          color: buttonColor ?? ColorConstants.instance?.mainColor,
          borderRadius: BorderRadius.circular(context.sized.dynamicWidth(radius!)),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(BorderSide(color: borderColor ?? Colors.transparent, width: 0.2)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.sized.dynamicWidth(radius!)),
              ),
            ),
            elevation: MaterialStateProperty.all<double>(0.5),
            minimumSize: MaterialStateProperty.all(const Size(10, 50)),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shadowColor: isThereShadow! ? MaterialStateProperty.all(Colors.transparent) : null,
          ),
          onPressed: () {
            onTap();
          },
          child: Center(
            child: CustomText(
              text!,
              textStyle: context.general.textTheme.headline5?.copyWith(color: textColor, fontSize: fontSize?.sp, fontWeight: fontWeight),
            ),
          ),
        ),
      ),
    );
  }
}
