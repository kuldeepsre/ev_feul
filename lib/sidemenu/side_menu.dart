import 'package:ev_feul/tabs/tabspage.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';


class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return    Stack(
    children: [
      Drawer(
      child: Container(
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
            ListView(

              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: DrawerHeader(
                    child: Text(
                      '',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.transparent,
                        image: DecorationImage(



                            fit: BoxFit.contain, image: AssetImage('assets/images/logo.png',))),
                  ),
                ),
                ListTile(

                  leading: const Icon(Icons.home,color: Colors.white,),
                  title: Text('Home',textScaleFactor: 1,style:sideMenuStyle,),
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TabsPage(selectedIndex: 0)),
                    )
                  },
                ),
                ListTile(

                  leading: const Icon(Icons.grid_view_rounded,color: Colors.white,),
                  title: Text('Subscription Plan',textScaleFactor: 1,style:sideMenuStyle,),
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TabsPage(selectedIndex: 0)),
                    )
                  },
                ),
                ListTile(

                  leading: const Icon(Icons.grid_view_rounded,color: Colors.white,),
                  title: Text('Swap Station',textScaleFactor: 1,style:sideMenuStyle,),
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TabsPage(selectedIndex: 0)),
                    )
                  },
                ),
                ListTile(

                  leading:  Image.asset("assets/images/battery.png"),
                  title: Text('My Plan',textScaleFactor: 1,style:sideMenuStyle,),
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TabsPage(selectedIndex: 0)),
                    )
                  },
                ),
                ListTile(
                  leading:  Image.asset("assets/images/clock.png"),
                  title: Text('Swap History',textScaleFactor: 1,style:sideMenuStyle,),
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => TabsPage(selectedIndex: 0)),
                    )
                  },
                ),


              ],
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
                      Colors.white,
                      Colors.white,


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
    ),],
    );
  }
}