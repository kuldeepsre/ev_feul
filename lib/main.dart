import 'package:ev_feul/tabs/tabspage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white
      ),
      home: TabsPage(selectedIndex: 0),
      debugShowCheckedModeBanner: false,
    
    );
  }
}

