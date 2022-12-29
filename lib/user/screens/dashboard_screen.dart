import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/model/near_response.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geocoding/geocoding.dart';
import '../mannage_patroller.dart';



import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';



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

  List<Data> nearlist=[];

  String finaladdress="";
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

            if(state is NearListLoaded)
              {
                nearlist=  state.nearlist;
              }
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
                          child: Text('Welcome to ${ GlobleConstant.loginResponse!.success!.userData!.ownerName}',textScaleFactor: 1,style: subheadingStyle,),
                        ),
                        nearlist.isNotEmpty? 
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
                                const SizedBox(height: 10,),
                                Text('Nearest Swap Stations',textScaleFactor: 1,style: sideMenuBlack,),

                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: nearlist.length,
                                  itemBuilder: (context, i){
                                    var model=nearlist[i];

                                    getAddress(model);
                                       return  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                                      child: Card(
                                        elevation: 7,
                                        shadowColor: Colors.white,
                                        child: Container(

                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(const Radius.circular(5))   ,  gradient: LinearGradient(
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
                                                     Expanded(
                                                      flex: 2,
                                                        child: Text("${model.ownerName.toString().toUpperCase()}",softWrap: true,textScaleFactor: 1,style:const TextStyle(
                                                      color: Colors.lightBlue,
                                                      fontSize: 14,
                                                      fontWeight:FontWeight.bold,
                                                    ),)),
                                                    Expanded(child: Card(
                                                        color: Colors.yellow,
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                          child: Center(child: Text("${model.distance} KM",softWrap: true,textScaleFactor: 1,style:listItemSubTitleStyle,)),
                                                        ))),

                                                  ],
                                                ),
                                                ListTile(
                                                  leading: const Icon(Icons.add_location,color: Colors.yellow,),
                                                  title: Text("$finaladdress",softWrap: true,textScaleFactor: 1,style:graySubHeadingStyle,),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) =>  ManagePatrollerPage(patrollerId:model.id.toString())),
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
                        ):const Text("")
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

    double ? lat=0.0;
    double? long=0.0;
    final gateBloc = BlocProvider.of<GateBloc>(context);
    gateBloc.add(NearByList(lat:lat,long:long));

  }

  Future<void> getAddress(Data model) async {

    double? lat=double.tryParse(model.latitude.toString());
    double? long=double.tryParse(model.longitude.toString());
    List<Placemark> addresses = await
    placemarkFromCoordinates(lat!,long!);

     finaladdress = "${addresses.first.name}" + "${addresses.first.administrativeArea}"+ "${addresses.first.postalCode}";

  }

  }


