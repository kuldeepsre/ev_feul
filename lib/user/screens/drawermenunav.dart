import 'package:ev_feul/custom_widget/colored_status_bar.dart';
import 'package:ev_feul/tabs/profileScreen.dart';
import 'package:ev_feul/user/screens/plan_list.dart';
import 'package:ev_feul/user/screens/profile_screen.dart';
import 'package:ev_feul/user/screens/subscriptions.dart';
import 'package:ev_feul/user/screens/swap_history.dart';
import 'package:ev_feul/user/screens/swap_stations.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/custom_dialog.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard_screen.dart';

class MainDashboard extends StatefulWidget {
  int selectedPage;
   MainDashboard({Key? key,required this.selectedPage}) : super(key: key);



  @override
  _MainDashboardState createState() => _MainDashboardState();
}

//3
class _MainDashboardState extends State<MainDashboard> {

  //set initial value
  int _selectedPage = 0;

  //workaround hack
  var _selectedTitle = 'Home';

  //set array that pass page that been imported
  final _pageOptions = [
    const DashboardScreen(),
    const SubscriptionPlan(),
    const SwapStation(),
    const PlanList(),
    const SwapHistory(),
    const Profile(),
  ];


  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,overlays: [SystemUiOverlay.top]);
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => CustomDialogs.onBackPressed(context),
        child: Scaffold(
          appBar: AppBar(


            flexibleSpace:  Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0))   ,  gradient: LinearGradient(
                colors: [
                  ColorUtils.appbar,
                  ColorUtils.appbar2,

                ],
              )

              ),

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo.png",width: 200,height: 40,),
                    ],
                  ),
                ),
              ),
            ),
            elevation: 0.0,
          ),
          body: _pageOptions[ _selectedPage ],
          drawer: Drawer(
            child:
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                    child: Image.asset("assets/images/screen_bg_2.png",fit: BoxFit.fill,)),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading:   Image.asset("assets/images/logo.png",),
                      ),
                      ListTile(

                        leading: const Icon(Icons.home,color: Colors.white,),
                        title: Text('Home',textScaleFactor: 1,style:sideMenuStyle,),
                        onTap: () => {

                          setState(() {
                        _selectedPage = 0;
                          }),
                         Navigator.pop(context)
                        },
                      ),
                      ListTile(

                        leading: const Icon(Icons.grid_view_rounded,color: Colors.white,),
                        title: Text('Subscription Plan',textScaleFactor: 1,style:sideMenuStyle,),
                        onTap: () => {
                          setState(() {
                            _selectedPage = 1;
                          }),
                          Navigator.pop(context)
                        },
                      ),
                      ListTile(

                        leading:  Image.asset("assets/images/battery.png",),
                        title: Text('Swap Station',textScaleFactor: 1,style:sideMenuStyle,),
                        onTap: () => {
                          setState(() {
                            _selectedPage = 2;
                          }),
                          Navigator.pop(context)

                        },
                      ),
                      ListTile(

                        leading: const Icon(Icons.list,color: Colors.white,),
                        title: Text('My Plan',textScaleFactor: 1,style:sideMenuStyle,),
                        onTap: () => {
                          setState(() {
                            _selectedPage = 3;
                          }),
                          Navigator.pop(context)
                        },
                      ),
                      ListTile(

                        leading: const Icon(Icons.history,color: Colors.white,),
                        title: Text('Swap History',textScaleFactor: 1,style:sideMenuStyle,),
                        onTap: () => {
                          setState(() {
                            _selectedPage = 4;
                          }),
                          Navigator.pop(context)
                        },
                      ),
                      ListTile(

                        leading: const Icon(Icons.history,color: Colors.white,),
                        title: Text('Profile',textScaleFactor: 1,style:sideMenuStyle,),
                        onTap: () => {
                          setState(() {
                            _selectedPage = 5;
                          }),
                          Navigator.pop(context)
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    CustomDialogs.showLogoutConfirmation(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height*.08,
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
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
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
                ),

              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            //currentIndex -> tab index value
            currentIndex: _selectedPage,
            selectedItemColor: Colors.green,
            showUnselectedLabels:false,
            unselectedItemColor: Colors.black,
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
                  _selectedTitle = 'Swap Station';
                }
                if(index == 3){
                  _selectedTitle = 'Landscape';
                }
                if(index == 4){
                  _selectedTitle = 'Landscape';
                }
                if(index == 5){
                  _selectedTitle = 'Profile';
                }
              });
            },

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded),
                label:'Subscription Plan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.battery_charging_full_sharp),
                label:'Swap Station',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list,),
                label: 'My Plan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_sharp,),
                label:'Swap History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded,),
                label:'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
