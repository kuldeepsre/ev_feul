import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/model/firebase_response.dart';
import 'package:ev_feul/model/near_response.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geolocator/geolocator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

import '../../model/CommonData.dart';
import '../mannage_patroller.dart';


class SwapStation extends StatefulWidget {
  const SwapStation({Key? key}) : super(key: key);

  @override
  _GateScreenState createState() => _GateScreenState();
}

class _GateScreenState extends State<SwapStation> {
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

  List<FirbaseResponse> nearlist=[];
  List<CommonResponse> commonList=[];

  @override
  void initState() {
    super.initState();
    _validate = false;
    isLogin = false;
    _getLocation();

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
              callAPi();
            }
            if(state is LoadedCompeted)
            {
              setState(() {
                commonList;
              });
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
                      children:  <Widget>[
                        SizedBox(height: 30,),
                        Center(child: Text("Swap Stations",textScaleFactor: 1,style:sideMenuStyle,)),
                        SizedBox(height: 30,),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: commonList.length,
                          itemBuilder: (context, i){
                            var model=commonList[i];



                            return  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3.0),
                              child: Card(
                                elevation: 7,
                                shadowColor: Colors.white,
                                child: Container(

                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(5))   ,  gradient: LinearGradient(
                                    colors: [
                                      ColorUtils.card1ln,
                                      ColorUtils.grayColor,


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
                                          title: Text("${model.address}",softWrap: true,textScaleFactor: 1,style:graySubHeadingStyle,),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  ManagePatrollerPage(patrollerId:model.id.toString(),lat: model.latitude.toString(),long:model.longitude.toString())),
                                            );
                                          },
                                          child: ListTile(
                                            leading: const Icon(Icons.directions,color: Colors.green,),
                                            trailing: Text("${model.updatedAt}",softWrap: true,textScaleFactor: 1,style:graySubHeadingStyle,),
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
                  )
                ],

              );
            },
          ),
        ));
  }


  Future _getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }else if(permission == LocationPermission.deniedForever){
        print("'Location permissions are permanently denied");
      }else{
        print("GPS Location service is granted");

        final gateBloc = BlocProvider.of<GateBloc>(context);
        gateBloc.add(NearByList());
      }
    }
    else{
      print("GPS Location permission granted.");

      final gateBloc = BlocProvider.of<GateBloc>(context);
      gateBloc.add(NearByList());
    }


  }

  Future<void> callAPi() async {

    nearlist= GlobleConstant.list;
    commonList.clear();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var clat = position.latitude;
    var clong = position.longitude;
    for(int i=0;i<nearlist.length-1;i++)
    {
      if(nearlist[i].latitude==0)
      {

      }
      else{
        double? lat=double.tryParse( nearlist[i].latitude.toString());
        double? long=double.tryParse( nearlist[i].latitude.toString());
        double distanceInMeters = Geolocator.distanceBetween(
            lat!,long!,clat,clong);
        double distanceInKiloMeters = distanceInMeters / 1000;
        double roundDistanceInKM =
        double.parse((distanceInKiloMeters).toStringAsFixed(2));
        commonList.add(CommonResponse(id:nearlist[i].id,address:nearlist[i].address,ownerName:nearlist[i].ownerName,latitude:nearlist[i].latitude,longitude:nearlist[i].longitude,distance:roundDistanceInKM,updatedAt: nearlist[i].updatedAt));
        // commonList.sort();
        // commonList.sort((a, b) => a.distance!.compareTo(b.distance!));

        final gateBloc = BlocProvider.of<GateBloc>(context);
        gateBloc.add(AfterLoad());
      }

    }

  }


}