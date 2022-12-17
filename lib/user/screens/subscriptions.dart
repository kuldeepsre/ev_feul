import 'package:ev_feul/sidemenu/side_menu.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';


class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({Key? key}) : super(key: key);

  @override
  _SubscriptionPlanState createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/bg.png",fit: BoxFit.fill,)),
        Column(
          children: [

            Center(child: Text("Subscription Plan",textScaleFactor: 1,style:sideMenuStyle,)),
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[

                      Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            side: BorderSide(width:1, color: Colors.white)),
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
                                    Center(child: Text("Plan 999",textScaleFactor: 1,style:listTextStyle,)),
                                    Center(child: Text("( ideal for 30+ swaps )",textScaleFactor: 1,style: listTextStyle,)),
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
                                    Center(child: Text("Plan 999",textScaleFactor: 1,style: listTextStyle,)),
                                    Center(child: Text("( ideal for 30+ swaps )",textScaleFactor: 1,style: listTextStyle,)),
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
                                    Center(child: Text("Rate per Swap : ₹99",textScaleFactor: 1,style: listTextStyle,)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 22,),
                            Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Subscription Plan",textScaleFactor: 1,style:sideMenuBlack,),
                                SizedBox(width: 20,),
                                Icon(Icons.list)
                              ],

                            )),
                            SizedBox(height: 32,),
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
            )
          ],
        ),
      ],
    );
  }
}