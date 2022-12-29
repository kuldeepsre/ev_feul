import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../mannage_patroller.dart';


import 'package:location/location.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _GateScreenState createState() => _GateScreenState();
}

class _GateScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GateBloc(GateInitial()),
      child: const Gate2Widget(),
    );
  }
}

class Gate2Widget extends StatefulWidget {
  const Gate2Widget({Key? key}) : super(key: key);

  @override
  _GateWidgetState createState() => _GateWidgetState();
}

class _GateWidgetState extends State<Gate2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late bool _validate;
  late bool isLogin;
  var FullNameController = TextEditingController();
  var DateController = TextEditingController();
  var AddressController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _validate = false;
    isLogin = false;
    _getLocation();
    final gateBloc = BlocProvider.of<GateBloc>(context);
    gateBloc.add(ParkingDataData(master_name: "parking_allotment"));

  }

  @override
  Widget build(BuildContext context) {
    var widgetMinWidth = 650;
    var totalWidth = MediaQuery.of(context).size.width;
    var totalPadding = 14;
    final gateBloc = BlocProvider.of<GateBloc>(context);
    ScrollController? _scrollController =
    ScrollController(initialScrollOffset: 0);
    return Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor: Colors.white,
        body: BlocListener<GateBloc, GateState>(
          listener: (context, state) {
          },
          child: BlocBuilder(
            bloc: gateBloc,
            builder: (BuildContext context, GateState state) {
              if (state is GateLoading) {
                return const Center(child: CustomLoader());
              }
              return Stack(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("assets/images/bg.png",fit: BoxFit.fill,)),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children:  <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Dashboard',textScaleFactor: 1,style: headingStyle,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Welcome ${GlobleConstant.newGuestName}',textScaleFactor: 1,style: subheadingStyle,),
                        ),
                         Card(
                          elevation: 15,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              side: BorderSide(width: 1, color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('Nearest Swap Stations',textScaleFactor: 1,style: sideMenuBlack,),

                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 6,
                                  itemBuilder: (context, i){
                                    return  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                                      child: Card(
                                        elevation: 7,
                                        shadowColor: Colors.white,
                                        child: Container(

                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(5))   ,  gradient: LinearGradient(
                                            colors: [
                                              ColorUtils.card1ln,
                                              ColorUtils.card2ln,

                                            ],
                                          )
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Expanded(
                                                      flex: 2,
                                                        child: Text("AKS Swap Station",softWrap: true,textScaleFactor: 1,style:TextStyle(
                                                      color: Colors.lightBlue,
                                                      fontSize: 14,
                                                      fontWeight:FontWeight.bold,
                                                    ),)),
                                                    Expanded(child: Card(
                                                        color: Colors.yellow,
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                          child: Center(child: Text("1.5",softWrap: true,textScaleFactor: 1,style:sideMenuStyle,)),
                                                        ))),

                                                  ],
                                                ),
                                                ListTile(

                                                  leading: Icon(Icons.add_location,color: Colors.yellow,),
                                                  title: Text("iThum Tower a, Noida Sector 62, Uttar Pradesh. (201301)",softWrap: true,textScaleFactor: 1,style:graySubHeadingStyle,),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) =>  ManagePatrollerPage(patrollerId:GlobleConstant.save)),
                                                    );
                                                  },
                                                  child: ListTile(

                                                    leading: const Icon(Icons.directions,color: Colors.green,),
                                                    title: Text("Get Direction",softWrap: true,textScaleFactor: 1,style:graySubHeadingStyle,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                        ),

                      ],
                    ),
                  )
                ],

              );
            },
          ),
        ));
  }

  Future _getLocation() async {
    Location location = new Location();
    LocationData _pos = await location.getLocation();
    double ? lat=_pos.latitude;
    double? long=_pos.longitude;
    final gateBloc = BlocProvider.of<GateBloc>(context);
    gateBloc.add(NearByList(lat:lat!,long:long!));

  }


}