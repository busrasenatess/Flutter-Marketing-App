import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../base/state/base_state.dart';
import '../../constants/app/color_constants.dart';
import '../text/custom_text.dart';

class TabbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const TabbarWidget({
    Key? key,
    required this.onChange,
  }) : super(key: key);
  final Function(int) onChange;
  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(20);
}

class _TabbarWidgetState extends BaseState<TabbarWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabItems = [
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "groceries",
    "home-decoration",
    "furniture",
    "tops",
    "womens-dresses",
    "womens-shoes",
    "mens-shirts",
    "mens-shoes",
    "mens-watches",
    "womens-watches",
    "womens-bags",
    "womens-jewellery",
    "sunglasses",
    "automotive",
    "motorcycle",
    "lighting"
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabItems.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicWidth(1),
      height: context.sized.dynamicHeight(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TabBar(
            isScrollable: true,
            onTap: (index) {
              widget.onChange.call(index);
            },
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            labelStyle: const TextStyle(color: Colors.red),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            controller: _tabController,
            indicatorColor: ColorConstants.instance?.mainColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: const EdgeInsets.only(top: 5, right: 5, left: 5),
            tabs: tabItems.map((e) => _itemText(e)).toList(),
          ),
        ),
      ),
    );
  }

  CustomText _itemText(String text) => CustomText(
        text.ext.toCapitalized(),
        textStyle: context.general.textTheme.subtitle1?.copyWith(color: ColorConstants.instance?.cadetBlue),
      );
}
