
import 'package:ev_feul/user/screens/home.dart';
import 'package:ev_feul/user/screens/profile.dart';
import 'package:ev_feul/user/screens/search.dart';
import 'package:ev_feul/user/screens/swap_stations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Image icon;
  TabNavigationItem({required this.page, required this.title, required this.icon});
  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const Home(),
          icon: Image.asset("assets/images/home.png",),
          title: const Text("Home"),
        ),
        TabNavigationItem(
          page: Search(),
          icon: Image.asset("assets/images/myplan.jpg",),
          title: const Text("Subscription Plan"),
        ),
        TabNavigationItem(
         page: const SwapStation(),
          icon: Image.asset("assets/images/battery.png",),
         title: const Text("Swap Station",),
  ),
/*        TabNavigationItem(
          page:  Profile(),
          icon: Image.asset("assets/images/battery.png",),
          title: const Text("Swap Station",),
        ),*/
      ];
}
