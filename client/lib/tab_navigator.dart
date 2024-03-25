import 'package:flutter/material.dart';
import 'package:anime_and_comic_entertainment/app.dart';
import 'package:anime_and_comic_entertainment/bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => tabItem == "Page1"
                ? Page1()
                : tabItem == "Page2"
                    ? Page2()
                    : Page3());
      },
    );
  }
}
