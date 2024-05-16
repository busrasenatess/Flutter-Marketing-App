import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:marketingapp/core/init/navigation/routes.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/bloc/product_bloc.dart';
import '../../core/base/service/i_product_service.dart';
import '../../core/base/service/product_service.dart';
import '../../core/components/text/custom_text.dart';
import '../../core/constants/app/color_constants.dart';
import '../../core/extensions/num_extensions.dart';
import '../../core/init/network/network_manager.dart';

@RoutePage()                    
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //TODO: USED PROXY DESIGN PATTERN
  late ProductBloc _productBloc;
  late IProductService _productService;
  late VexanaManager _vexanaManager;
  @override
  void initState() {
    _vexanaManager = VexanaManager();
    _productService = ProductService(_vexanaManager);
    _productBloc = ProductBloc(_productService);
    _productBloc.add(FetchAllProducts());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      context.router.replace(const MainRoute(children: [HomeRoute()]));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.instance?.alabaster,
      width: context.sized.width,
      height: context.sized.height,
      child: Column(
        children: [
          20.h.ph,
          Lottie.asset("assets/lottie/splash_lottie.json"),
          10.h.ph,
          CustomText(
            "Easy Shopping",
            textStyle: context.general.textTheme.headline3
                ?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w700),
          ),
          28.h.ph,
          CustomText(
            "Yükleniyor ...",
            textStyle: context.general.textTheme.headline6?.copyWith(color: ColorConstants.instance?.cadetBlue),
          )
        ],
      ),
    );
  }
}
