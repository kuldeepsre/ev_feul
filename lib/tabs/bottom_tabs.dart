
import 'package:ev_feul/user/screens/home.dart';
import 'package:ev_feul/user/screens/profile.dart';
import 'package:ev_feul/user/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;
  TabNavigationItem({required this.page, required this.title, required this.icon});
  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const Home(),
          icon: const Icon(Icons.home),
          title: const Text("Home"),
        ),
        TabNavigationItem(
          page: Search(),
          icon: const Icon(Icons.search),
          title: const Text("Search"),
        ),
        TabNavigationItem(
          page: Profile(),
          icon: const Icon(Icons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: Profile(),
          icon: const Icon(Icons.home),
          title: Text("Home"),
        ),
      ];
}
