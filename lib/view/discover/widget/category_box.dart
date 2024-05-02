import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:marketing_app/core/init/navigation/routes.dart';

import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/color_constants.dart';

class CategoryBoxWidget extends StatelessWidget {
  const CategoryBoxWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(SearchProductRoute(word: name.toLowerCase(), isCategoryName: true)),
      child: Center(
        child: Container(
            width: context.sized.dynamicWidth(0.9),
            height: context.sized.dynamicHeight(0.15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: context.border.lowBorderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: context.padding.low,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    name,
                    textStyle: context.general.textTheme.headline6?.copyWith(color: ColorConstants.instance?.mainColor),
                  ),
                  SizedBox(
                    width: 150,
                    height: 200,
                    child: Lottie.asset("assets/lottie/${checkLottiePath(name)}-lottie.json", fit: BoxFit.fill),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

String checkLottiePath(String categoryName) {
  switch (categoryName) {
    case "Automotive":
      return "automotive";
    case "Furniture":
      return "furniture";
    case "Laptops":
      return "laptop";
    case "Skincare":
      return "skincare";
    case "Smartphones":
      return "smartphone";
    default:
      return "sunglasses";
  }
}
