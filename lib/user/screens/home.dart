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
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dashboard',textScaleFactor: 1,style: headingStyle,),
        Text('Welcome ${GlobleConstant.loginResponse!.success!.userData!.ownerName}}',textScaleFactor: 1,style: subheadingStyle,),
        SizedBox(height: 10,),
        Text('Nearest Swap Stations',textScaleFactor: 1,style: subheadingStyle,),
        ListView.builder(
          itemCount: 6,
          itemBuilder: (context, i){
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))   ,  gradient: LinearGradient(
                  colors: [
                    ColorUtils.card1ln,
                    ColorUtils.card2ln,

                  ],
                )
                ),
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text("Nearest Swap Stations",softWrap: true,textScaleFactor: 1,style:graySubHeadingStyle,)),
                        Expanded(child: Card(
                            color: Colors.yellow,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("1.5",softWrap: true,textScaleFactor: 1,style:sideMenuStyle,),
                            ))),

                      ],
                    ),
                    ListTile(

                      leading: Icon(Icons.add_location,color: Colors.yellow,),
                      title: Text("iThum Tower a, Noida Sector 62, Uttar Pradesh. (201301)",softWrap: true,textScaleFactor: 1,style:graySubHeadingStyle,),
                    ),
                    SizedBox(height: 5,),
                    ListTile(

                      leading: Icon(Icons.directions,color: Colors.green,),
                      title: Text("Get Direction",softWrap: true,textScaleFactor: 1,style:graySubHeadingStyle,),
                    ),
                  ],
                ),
              ),
            );
          },
        ),


      ],);
  }
}