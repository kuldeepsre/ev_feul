import 'package:ev_feul/sidemenu/side_menu.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                icon: const Icon(
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
      body:Stack(
       children: [
         Image.asset("assets/images/common_bg.jpg",fit:BoxFit.fill,),
         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text('Dashboard',textScaleFactor: 1,style: headingStyle,),
               Text('Welcome User',textScaleFactor: 1,style: subheadingStyle,),
               Image.asset("assets/images/bg_card.png",fit:BoxFit.fill,),
               SizedBox(height: 10,),
               Text('Nearest Swap Stations',textScaleFactor: 1,style: subheadingStyle,),
           ListView.builder(
             itemCount: 6,
             itemBuilder: (context, i){
              return  Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))   ,  gradient: LinearGradient(
                  colors: [
                    ColorUtils.card1ln,
                    ColorUtils.card2ln,

                  ],
                )

                ),
                child: Text(""),
              );
             },
           ),


             ],),),
       ],
      )
    );
  }
}