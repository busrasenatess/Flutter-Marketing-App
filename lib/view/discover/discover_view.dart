import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../core/extensions/num_extensions.dart';
import 'widget/category_box.dart';

// ignore: must_be_immutable
@RoutePage()
class DiscoverView extends StatelessWidget {
  DiscoverView({super.key});
  List<String> categories = ["Smartphones", "Laptops", "Automotive", "Skincare", "Furniture", "Sunglasses"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.h.ph,
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: categories.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = categories[index];
            return Padding(
              padding: context.padding.low,
              child: CategoryBoxWidget(name: item),
            );
          },
        ),
      ],
    );
  }
}
