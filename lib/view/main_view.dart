import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../core/components/bottomBar/bottom_navbar.dart';
import '../core/components/scaffold/scaffold.dart';
import 'basket/basket_view.dart';
import 'discover/discover_view.dart';
import 'favorites/favorites_view.dart';
import 'home/home_view.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> _pagesList = [const HomeView(), DiscoverView(), const FavoritesView(), const BasketView()];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isThereAppbar: false,
      body: _pagesList.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavbarWidget(onChange: (index) {
        _currentIndex = index;
        setState(() {});
      }),
    );
  }
}
