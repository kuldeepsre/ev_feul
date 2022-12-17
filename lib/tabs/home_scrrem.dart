import 'package:ev_feul/tabs/profileScreen.dart';
import 'package:ev_feul/user/screens/swap_history.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> _widgetOptions = <Widget>[
   SwapHistory(),
   ProfileScreen(),
   SwapHistory(),
   SwapHistory(),

  ];
  int _currentSelected = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void _onItemTapped(int index) {
   /* index == 3
        ? _drawerKey.currentState!.openDrawer()
        : setState(() {
      _currentSelected = index;
    });*/
    _drawerKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title:  Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png",width: 200,height: 32,),
            ],
          ),
        ),

        leading: GestureDetector(
          onTap: (){
            _drawerKey.currentState!.openDrawer();
          },
            child: const Icon(Icons.segment_rounded)),


      ),
      body: _widgetOptions.elementAt(_currentSelected),

      drawer: Drawer(

        child:  Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0))   ,  gradient: LinearGradient(
            colors: [
              ColorUtils.blue1,
              ColorUtils.blue2,

            ],
          )

          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(

                      leading:   Image.asset("assets/images/logo.png",),
                      trailing: GestureDetector(
                          onTap: (){
                            _drawerKey.currentState!.openEndDrawer();
                          },
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home,color: Colors.white,),
                      title: Text('Home',textScaleFactor: 1,style:sideMenuStyle,),
                      onTap: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SwapHistory()),
                        )
                      },
                    ),
                    ListTile(

                      leading: const Icon(Icons.grid_view_rounded,color: Colors.white,),
                      title: Text('Subscription Plan',textScaleFactor: 1,style:sideMenuStyle,),
                      onTap: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SwapHistory()),
                        )
                      },
                    ),
                    ListTile(

                      leading:  Image.asset("assets/images/battery.png",),
                      title: Text('Swap Station',textScaleFactor: 1,style:sideMenuStyle,),
                      onTap: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SwapHistory()),
                        )
                      },
                    ),
                    ListTile(

                      leading: const Icon(Icons.person,color: Colors.white,),
                      title: Text('My Plan',textScaleFactor: 1,style:sideMenuStyle,),
                      onTap: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SwapHistory()),
                        )
                      },
                    ),
                    ListTile(
                      leading:  Image.asset("assets/images/clock.png"),
                      title: Text('Swap History',textScaleFactor: 1,style:sideMenuStyle,),
                      onTap: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SwapHistory()),
                        )
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height*.06,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))   ,gradient: LinearGradient(
                      colors: [
                        Colors.lightGreenAccent,
                        Colors.lightGreenAccent,


                      ],
                    )

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Image.asset("assets/images/logout.png",color: Colors.green,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: const Text(
                            "Logout",
                            textScaleFactor: 1,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
       // onTap: _onItemTapped,
        currentIndex: _currentSelected,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey[800],
        selectedItemColor: Color.fromRGBO(10, 135, 255, 1),
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
      ),
    );
  }
}

