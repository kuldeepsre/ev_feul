import 'package:ev_feul/user/screens/home.dart';
import 'package:ev_feul/user/screens/subscriptions.dart';
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
      page: Home(),
      icon: Icon(Icons.home),
      title: Text("Home"),
    ),
    TabNavigationItem(
      page: Search(),
      icon: Icon(Icons.search),
      title: Text("Search"),
    ),
    TabNavigationItem(
      page: SubscriptionPlan(),
      icon: Icon(Icons.home),
      title: Text("Home"),
    ),
  ];
}