import 'package:ev_feul/user/screens/home.dart';
import 'package:ev_feul/user/screens/profile.dart';
import 'package:ev_feul/user/screens/swap_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {


  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

//3
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  //set initial value
  int _selectedPage = 0;

  //workaround hack
  var _selectedTitle = 'Home';

  //set array that pass page that been imported
  final _pageOptions = [
    Home(),
     Profile(),
    SwapHistory(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(

      //header
      appBar: AppBar(
        title: Text(_selectedTitle),

        //https://stackoverflow.com/questions/49015038/removing-the-drop-shadow-from-a-scaffold-appbar-in-flutter

        elevation: 0.0,
      ),

      //body -> content of page selected
      //fired via sidemenu @ tabs (refer: onTap)
      body: _pageOptions[ _selectedPage ],

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: <Widget>[

            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),

            ListTile(
              title: Text('Home'),
              onTap: () {

                setState(() {
                  _selectedPage = 0;
                });

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Work'),
              onTap: () {

                setState(() {
                  _selectedPage = 1;
                });

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Landscape'),
              onTap: () {
                setState(() {
                  _selectedPage = 2;
                });

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        //currentIndex -> tab index value
        currentIndex: _selectedPage,

        //upon tap
        onTap: (int index) {
          setState(() {

            _selectedPage = index;

            if(index == 0){
              _selectedTitle = 'Home';
            }

            if(index == 1){
              _selectedTitle = 'Work';
            }

            if(index == 2){
              _selectedTitle = 'Landscape';
            }
          });
        },

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home')
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.work),
              title: Text('Work')
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.landscape),
              title: Text('Landscape')
          ),
        ],
      ),
    );
  }
}
