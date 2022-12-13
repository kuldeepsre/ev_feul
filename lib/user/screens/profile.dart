import 'package:ev_feul/sidemenu/side_menu.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,

      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))   ,
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey,
                              Colors.white,


                            ],
                          )

                      ),
                      height:  MediaQuery.of(context).size.height*.30,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                       Container(


                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15)   ,
                             gradient: LinearGradient(
                           colors: [
                             ColorUtils.greenbtn,
                             ColorUtils.greenbtn,

                           ],
                         )

                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             children: [
                               Center(child: Text("Plan 999",textScaleFactor: 1,style: greyHeadingStyle,)),
                               Center(child: Text("( ideal for 30+ swaps )",textScaleFactor: 1,style: greyHeadingStyle,)),
                             ],
                           ),
                         ),
                       ),
                        SizedBox(height: 2,),
                        Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0)   ,
                              gradient: LinearGradient(
                                colors: [
                                  ColorUtils.greenbtn,
                                  ColorUtils.greenbtn,

                                ],
                              )

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Center(child: Text("Plan 999",textScaleFactor: 1,style: greyHeadingStyle,)),
                                Center(child: Text("( ideal for 30+ swaps )",textScaleFactor: 1,style: greyHeadingStyle,)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0)   ,
                              gradient: LinearGradient(
                                colors: [
                                  ColorUtils.grey,
                                  ColorUtils.whiteColor,

                                ],
                              )

                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Column(
                              children: [
                                Center(child: Text("Rate per Swap : ₹99",textScaleFactor: 1,style: greyHeadingStyle,)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child:
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 50),
                      child: Container(
                        height: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15))   ,  gradient: LinearGradient(
                          colors: [
                            ColorUtils.greenbtn,
                            ColorUtils.greenbtn,

                          ],
                        )

                        ),

                        child:  Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Text(
                              "Subscribe Now",
                              textAlign: TextAlign.center,
                              textScaleFactor: 1,
                              style: TextStyle(

                                color: Colors.white,
                                fontSize: 14.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    right: 0,
                    left: 0,
                    bottom: -20,
                  ),
                ],
              ),
            ],

          ),
        ],
      ),
    );
  }
}