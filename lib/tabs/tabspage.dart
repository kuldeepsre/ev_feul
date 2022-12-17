import 'package:flutter/material.dart';

import 'bottom_tabs.dart';

class TabsPage extends StatefulWidget {
  int selectedIndex = 0;

  TabsPage({required this.selectedIndex});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      _selectedIndex = widget.selectedIndex;
      print(_selectedIndex);
    });
  }
  @override
  void initState() {
    _onItemTapped(widget.selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: IndexedStack(
          index: widget.selectedIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            title: Text('Subscription Plan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('My Plan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_sharp,),
            title: Text('Swap History',textScaleFactor:1,),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}