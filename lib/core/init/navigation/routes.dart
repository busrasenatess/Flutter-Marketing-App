import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marketingapp/core/base/model/product_model.dart';
import 'package:marketingapp/view/basket/basket_view.dart';
import 'package:marketingapp/view/discover/discover_view.dart';
import 'package:marketingapp/view/favorites/favorites_view.dart';
import 'package:marketingapp/view/home/home_view.dart';
import 'package:marketingapp/view/main_view.dart';
import 'package:marketingapp/view/payment/payment_result_view.dart';
import 'package:marketingapp/view/payment/payment_view.dart';
import 'package:marketingapp/view/product/productDetail/product_detail_view.dart';
import 'package:marketingapp/view/product/searchProduct/search_product_view.dart';
import 'package:marketingapp/view/splash/splash_view.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|View|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: "/", page: SplashRoute.page, initial: true),
    AutoRoute(path: "/main", page: MainRoute.page, children: [
      AutoRoute(path: "home", page: HomeRoute.page),
      AutoRoute(path: "basket", page: BasketRoute.page),
      AutoRoute(path: "discover", page: DiscoverRoute.page),
      AutoRoute(path: "favorites", page: FavoritesRoute.page),
    ]),
    AutoRoute(path: "/search", page: SearchProductRoute.page),
    AutoRoute(path: "/product-detail", page: ProductDetailRoute.page),
    AutoRoute(path: "/payment", page: PaymentRoute.page),
    AutoRoute(path: "/payment-result", page: PaymentResultRoute.page),
  ];
}

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
// @MaterialAutoRouter(
//   replaceInRouteName: 'Page|View|Screen,Route',
//   routes: <AutoRoute>[
    // AutoRoute(path: "/", page: SplashView, initial: true),
    // AutoRoute(path: "", page: MainView, children: [
    //   AutoRoute(path: "home", page: HomeView),
    //   AutoRoute(path: "basket", page: BasketView),
    //   AutoRoute(path: "discover", page: DiscoverView),
    //   AutoRoute(path: "favorites", page: FavoritesView),
    // ]),
    // AutoRoute(path: "search", page: SearchProductView),
    // AutoRoute(path: "product-detail", page: ProductDetailView),
    // AutoRoute(path: "payment", page: PaymentView),
    // AutoRoute(path: "payment-result", page: PaymentResultView),
//   ],
// )
// class $AppRouter {}