import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/app/color_constants.dart';

class ImageSlideWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final List<String> images;

  // ignore: use_key_in_widget_constructors
  const ImageSlideWidget({this.width = 0.85, this.height = 0.3, this.radius = 0, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sized.dynamicWidth(width),
      height: context.sized.dynamicHeight(height),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: ImageSlideshow(
        initialPage: 0,
        indicatorColor: ColorConstants.instance?.mainColor,
        indicatorBackgroundColor: Colors.grey,
        children: images
            .map((image) => GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: context.border.lowBorderRadius,
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ))
            .toList(),
        onPageChanged: (value) {},
      ),
    );
  }
}
