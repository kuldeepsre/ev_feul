

import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/utils/color_utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


import 'package:geocoding/geocoding.dart';
int count = 0;
bool checkDistance = false;
var totalDistance = 0.0;
double totalDurations =0.0;

class ManagePatrollerPage extends StatefulWidget {
  String patrollerId;
  String lat,long;

  ManagePatrollerPage({Key? key, required this.patrollerId,required this.lat,required this.long}) : super(key: key);

  @override
  _PatrollerFormState createState() => _PatrollerFormState();
}

class _PatrollerFormState extends State<ManagePatrollerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GateBloc(GateInitial()),
      child: const _PatrollerFormStateWidget(),
    );
  }
}

class _PatrollerFormStateWidget extends StatefulWidget {
  const _PatrollerFormStateWidget({Key? key}) : super(key: key);

  @override
  _PatrollerFormStateWidgetState createState() =>
      _PatrollerFormStateWidgetState();
}

class _PatrollerFormStateWidgetState extends State<_PatrollerFormStateWidget> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  late bool _validate;


  static  double CAMERA_ZOOM = 12;
  static double CAMERA_TILT = 90;
  static double CAMERA_BEARING = 0;
 LatLng mapPosition = const LatLng(23.8021939,86.3642084);
  var _darkTheme = false;

  //LiveTrakingResponse? liveTrakingResponse;

//  List<LiveTrakingResponse>  list=[];
/*  List<HistoricalList> list = [];
  List<HistoricalList> historicalList = [];
  List<LastLatList> lastlatlongList = [];*/
  final double _initFabHeight = 20.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  bool showPanelUpDown = true;
  bool showMenuContainer = false;
  bool isHistoricalView = false;
  bool anyScreenOpened = false;
  int? currentWidgetIndex;
  double dynamicSlideUpPanelHeightOpenPercentage = 0.4;
  double dynamicSlideUpPanelHeightClosePercentage = 0.2;
  bool pannelstatus = true;
  double zoomVal = 18;
  double sourceLat = 30.7352102, sourceLng = 76.6934878, desLat = 0, desLng = 0;
  CameraPosition? initialCameraPosition;

  //     zoom: CAMERA_ZOOM,
  //     zoom: 9,
  //     tilt: CAMERA_TILT,
  //     bearing: CAMERA_BEARING,
  //     target: SOURCE_LOCATION);
  // target: LatLng(23.5385134, 87.3512902));
  String? name;

  String? sourceAddress = "NA", lastAddress = "NA";

  String? lastdate;
  String? time;
  var selectedTime;

  TimeOfDay? pickedTime;

  var timeStart;

  TimeOfDay? time2, checkoutTime;

  var _date, datetime;

  var getCurrentLocation;

  dynamic? date;

  String? starttime;

  List<LatLng> polylineCoordinates = [];
  List<LatLng> polylineCoordinates2 = [];
  Set<Marker> _markers = <Marker>{};
  Set<Polyline> _polylines = <Polyline>{};
  Set<Polyline> _polylines1 = <Polyline>{};
  Set<Polyline> _polylines2 = <Polyline>{};
  Set<Polyline> _historicalPolygon = <Polyline>{};

  Set<Polygon> _polygons = <Polygon>{};

  Set<Circle> mCircle = {
    Circle(
      circleId: const CircleId("id1"),
      center: const LatLng(0, 0),
      strokeColor: ColorUtils.app_primary_color,
      radius: 12,
    ),
  };

  initPanelController() {
    print('initPanelController -- start');
    print(pc.isAttached);

    if (!pc.isAttached) {
      print('initPanelController -- null');
      pc = new PanelController();
    }
  }

  PanelController pc = new PanelController();

  //Google rout set
  late GoogleMapController mapController;
  Marker? _origin;
  Marker? _destination;


  @override
  void initState() {
    super.initState();

    final patrollerSaveBloc = BlocProvider.of<GateBloc>(context);

   /* patrollerSaveBloc
        .add(LatLongListdata(username_lastlnt: Constants.liveid.toString()));*/
       _validate = false;
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final patrollerSaveBloc = BlocProvider.of<GateBloc>(context);
    initialCameraPosition = CameraPosition(
        zoom: zoomVal,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: LatLng(sourceLat, sourceLng));
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
               ColorUtils.boarderBlue,
                ColorUtils.blue2,
              ],
              stops: const [0.6, 1.0],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back_ios,
                    color:Colors.black,
                    size: 14,
                  ),
                  Text(
                    "Back",
                    textScaleFactor: 1,
                    style: TextStyle(
                        color:Colors.black,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Text(
              "Live Tracking",
              textScaleFactor: 1,

            ),
            const Text(" "),
          ],
        ),
        actions: const [],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: BlocListener<GateBloc, GateState>(
        listener: (context, state) async {
/*          if (state is UserTokenExpired) {}
          if (state is PatrollertpDataSaved) {
            CustomDialogs.showDialogMessageSiteProgressPhoto(context,
                "OTP verification successfully added !!! ", "Patroller OTP");
          }
          if (state is LiveDataLoaded) {
            list = state.historicalresponse;
            _markers.clear();
            _polylines.clear();
            polylineCoordinates.clear();
            polylineCoordinates2.clear();
            if (list.isNotEmpty) {
              _markers.clear();
              _polylines.clear();
              polylineCoordinates.clear();
              polylineCoordinates2.clear();

              List<Placemark> placemarks =
                  await placemarkFromCoordinates(list[0].lat!, list[0].lng!);

              Placemark startAddress = placemarks[0];
              String start =
                  "${startAddress.subAdministrativeArea}, ${startAddress.administrativeArea}, ${startAddress.country},${startAddress.locality}";
              _markers.add(Marker(
                  markerId: MarkerId('EndPaoint'),
                  position: LatLng(list[0].lat!, list[0].lng!),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  infoWindow: InfoWindow(title: '${start}')));

              // mCircle = Set.from([
              //   Circle(
              //     circleId: CircleId("StartPoint"),
              //     strokeColor:ColorConstant.btncolor ,
              //     strokeWidth: 1,
              //     center: LatLng(list[0].lat!, list[0].lng!),
              //     radius: 30,
              //   ),
              //
              // ]);
              mCircle = Set.from([
                Circle(
                  circleId: CircleId("EndPainf"),
                  strokeColor: ColorConstant.btncolor,
                  strokeWidth: 1,
                  center: LatLng(
                      list[list.length - 1].lat!, list[list.length - 1].lng!),
                  radius: 30,
                ),
              ]);

              List<Placemark> EndAddress = await placemarkFromCoordinates(
                  list[list.length - 1].lat!, list[list.length - 1].lng!);
              Placemark endplace = EndAddress[0];
              String EndPoint =
                  "${endplace.subAdministrativeArea}, ${endplace.administrativeArea}, ${endplace.country}";
              BitmapDescriptor endIcon = await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(48, 48)),
                "assets/images/bikegreen.png",
              );
              _markers.add(Marker(
                  markerId: MarkerId('EndPaoint'),
                  position: LatLng(
                      list[list.length - 1].lat!, list[list.length - 1].lng!),
                  icon: endIcon,
                  infoWindow: InfoWindow(title: '${EndPoint}')));
              _markers.add(Marker(
                  markerId: MarkerId('tt'),
                  position: LatLng(list[0].lat!, list[0].lng!),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueGreen),
                  infoWindow: InfoWindow(title: '${startAddress}')));
              for (int i = 0; i <= list.length - 1; i++) {
                polylineCoordinates.add(LatLng(list[i].lat!, list[i].lng!));
              }
              Polyline polyline = Polyline(
                polylineId: PolylineId('poly'),
                points: polylineCoordinates,
                color: Colors.blue,
                startCap: Cap.roundCap,
                endCap: Cap.roundCap,
                width: 5,
                visible: true,
              );
              _polylines.add(polyline);
              mapController.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(
                      list[list.length - 1].lat!, list[list.length - 1].lng!),
                  18));
              pc.close();

              //  getSourceLocation(sourceLat, sourceLng).toString();
              //   getLastLocation(desLat, desLng).toString();
            } else {
              mCircle = Set.from([
                Circle(
                  circleId: CircleId("id1"),
                  center: LatLng(0, 0),
                  strokeColor: ColorUtils.app_primary_color,
                  radius: 0,
                ),
              ]);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: ColorConstant.gray403,
                content: Text(
                  "Live Tracking data not found !!!",
                  textScaleFactor: 1,
                  style: TextStyle(color: ColorConstant.black900),
                ),
              ));
            }
          }
          if (state is PatrollerRouteLoaded) {
            historicalList = state.historicalresponse;

            checkDistance = true;

            _markers.clear();
            _polylines.clear();
            polylineCoordinates.clear();
            polylineCoordinates2.clear();
            if (historicalList.isNotEmpty) {
              _markers.clear();


              *//* GlobleConstant.totaldistance*//*
              _polylines.clear();
              polylineCoordinates.clear();
              polylineCoordinates2.clear();
              dynamic one = 0;
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  historicalList[0].lat!, historicalList[0].lng!);
              mCircle = Set.from([
                Circle(
                  circleId: CircleId("StartPoint"),
                  strokeColor: ColorConstant.btncolor,
                  strokeWidth: 1,
                  center:
                      LatLng(historicalList[0].lat!, historicalList[0].lng!),
                  radius: 30,
                ),
              ]);
              Placemark place = placemarks[0];
              String routeStartAdd =
                  "${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";

              List<Placemark> EndAddress = await placemarkFromCoordinates(
                  historicalList[historicalList.length - 1].lat!,
                  historicalList[historicalList.length - 1].lng!);
              Placemark endplace = EndAddress[0];
              String EndPoint =
                  "${endplace.subAdministrativeArea}, ${endplace.administrativeArea}, ${endplace.country}";
              BitmapDescriptor endIcon = await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(48, 48)),
                "assets/images/bikegreen.png",
              );
              _markers.add(Marker(
                  markerId: MarkerId('PStartPont'),
                  position:
                      LatLng(historicalList[0].lat!, historicalList[0].lng!),
                  icon: BitmapDescriptor.defaultMarker,
                  infoWindow: InfoWindow(title: '${routeStartAdd}')));
              bool islinebrake = false;
              for (int i = 0; i < historicalList.length; i++) {
                var time1;
                if (i == 0) {
                  polylineCoordinates2.add(
                      LatLng(historicalList[i].lat!, historicalList[i].lng!));
                  time1 = historicalList[i].starttime;
                  one = DateTimeUtils.checkTimeFormate(time1.toString());
                } else {
                  var time2 = historicalList[i].starttime!;
                  dynamic two =
                      DateTimeUtils.checkTimeFormate(time2.toString());
                  var first = one;
                  var last = two;
                  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                  var _date = dateFormat.format(DateTime.now());
                  DateTime a = DateTime.parse('$_date $first:00');
                  DateTime b = DateTime.parse('$_date $last:00');
                  time1 = historicalList[i].starttime;
                  one = DateTimeUtils.checkTimeFormate(time1.toString());
                  // print("islinebrake  >.. ");

                  if (b.difference(a).inMinutes >= 10) {
                    islinebrake = true;
                    print("islinebrake ");
                  }
                  if (islinebrake) {
                    time1 = historicalList[i].starttime;
                    callPolygone(polylineCoordinates2, i);
                    islinebrake = false;
                    polylineCoordinates2 = [];
                  } else {
                    polylineCoordinates2.add(
                        LatLng(historicalList[i].lat!, historicalList[i].lng!));
                  }
                }
              }
              if (polylineCoordinates2.length > 0) {
                callPolygone(polylineCoordinates2, -1); // change here -1
              }
              mapController.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(historicalList[0].lat!, historicalList[0].lng!), 18));
            } else {
              GlobleConstant.totaldistance="0";
              GlobleConstant.duartions="0";
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: ColorConstant.gray403,
                content: Text(
                  "Historical data not found !!!",
                  textScaleFactor: 1,
                  style: TextStyle(color: ColorConstant.black900),
                ),
              ));
            }
          }
          if (state is LiveLastLatLongLoaded) {
            _markers.clear();
            _polylines.clear();
            polylineCoordinates.clear();
            polylineCoordinates2.clear();
            lastlatlongList = state.lastlatresponse;
            if (lastlatlongList.isNotEmpty) {
              Constants.startAddress = lastlatlongList[0].address;
              date = lastlatlongList[0].starttime;
              Constants.phone = lastlatlongList[0].phone;
              starttime = DateTimeUtils.checkTMontFormate(
                  date.toString().split('.').first);
              BitmapDescriptor patrollerLastAddress =
                  await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(48, 48)),
                "assets/images/bikegreen.png",
              );
              _markers.add(Marker(
                markerId: MarkerId('PatrollerDetails'),
                position:
                    LatLng(lastlatlongList[0].lat!, lastlatlongList[0].lng!),
                icon: patrollerLastAddress,
                infoWindow: InfoWindow(title: '${lastlatlongList[0].address}'),
              ));
              mapController.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(lastlatlongList[0].lat!, lastlatlongList[0].lng!),
                  18));
              mCircle = Set.from([
                Circle(
                  circleId: CircleId("StartPoint"),
                  strokeColor: ColorConstant.btncolor,
                  strokeWidth: 1,
                  center:
                      LatLng(lastlatlongList[0].lat!, lastlatlongList[0].lng!),
                  radius: 30,
                ),
              ]);
            } else {
              Constants.starttime = "";
            }
          }*/
        },
        child: BlocBuilder(
          bloc: patrollerSaveBloc,
          builder: (BuildContext context, GateState state) {
            if (state is GateLoading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  heightFactor: .5,
                  child: CircularProgressIndicator(
                    color: ColorUtils.app_primary_color,
                    strokeWidth: 2,
                  ),
                ),
              );
            }
            return Scaffold(
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SlidingUpPanel(
                  controller: pc,
                  maxHeight: MediaQuery.of(context).size.height * .29,
                  minHeight: MediaQuery.of(context).size.height * .10,
                  //color: Colors.amber,
                  isDraggable: true,

                  //To Stop Panel closing while sliding down other containers
                  parallaxEnabled: false,
                //  collapsed: getOnBottomSheetCloseItems(),
                  parallaxOffset: .5,
                  body: _body(),
                  panelBuilder: (sc) => _panel(sc),
                  backdropOpacity: 1,
                  borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(18.0),
                      topRight: const Radius.circular(18.0)),
                  onPanelSlide: (double pos) => setState(() {
                    _fabHeight = pos * (_panelHeightOpen + _initFabHeight);
                  }),
                  onPanelOpened: () {
                    setState(() {
                      if (pannelstatus) {
                        showPanelUpDown = true;
                        dynamicSlideUpPanelHeightOpenPercentage =
                            dynamicSlideUpPanelHeightOpenPercentage;
                        dynamicSlideUpPanelHeightClosePercentage =
                            dynamicSlideUpPanelHeightClosePercentage;
                        showMenuContainer = true;
                      } else {
                        showPanelUpDown = true;
                        dynamicSlideUpPanelHeightOpenPercentage =
                            dynamicSlideUpPanelHeightOpenPercentage; //0.4;
                        dynamicSlideUpPanelHeightClosePercentage =
                            dynamicSlideUpPanelHeightClosePercentage; //0.2;
                        showMenuContainer = true;
                      }
                    });
                  },
                  onPanelClosed: () {
                    setState(() {
                      showMenuContainer = false;
                    });
                  },
                ),
              ),
              /*   floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  child: FloatingActionButton(
                    // isExtended: true,
                    child: Icon(Icons.location_on ),
                    backgroundColor: ColorConstant.btncolor,
                    onPressed: () {

                    },
                  ),
                ),
              ),*/
            );
          },
        ),
      ),
    );
  }

  // static const LatLng _center = const LatLng(45.521563, -122.677433);
  //
  // final Set<Marker> _markers = {};

  MapType _currentMapType = MapType.terrain;
  getSourceLocation(double lat, double long) async {
   /* List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark place = placemarks[0];
    sourceAddress =
        "${place.street}, ${place.name}, ${place.administrativeArea}, ${place.country}";
    print("GEO PLACE:$sourceAddress");*/
    //return fullAddress;
  }

/*  getLastLocation(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark place = placemarks[0];
    lastAddress =
        "${place.street}, ${place.name}, ${place.administrativeArea}, ${place.country}";
    print("GEO PLACE:$sourceAddress");
    //return fullAddress;
  }*/

  // void _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }
    _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    //showPinsOnMap();
    setState(() {
      // mapLoaded = 1;
    });
  }

  Widget _body() {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .16),
          child: GoogleMap(
            //onLongPress: _addMarker,

            markers: Set<Marker>.of(_markers),
            polylines: _polylines,
            myLocationEnabled: false,
            compassEnabled: true,
            tiltGesturesEnabled: true,
            mapType: _currentMapType,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: initialCameraPosition!,
            onTap: (LatLng loc) {
              //pinPillPosition = -200;
            },
            onMapCreated: _onMapCreated,
            // circles: mCircle,
            //onCameraMove: _onCameraMove,
            circles: mCircle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(const Radius.circular(6))),
                    margin: const EdgeInsets.only(top: 250, bottom: 20, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {

                            setState(() {
                              {
                                if (count == 0) {
                                  _currentMapType = MapType.terrain;
                                }
                                if (count == 1) {
                                  _currentMapType = MapType.satellite;
                                }
                                if (count == 2) {
                                  _currentMapType = MapType.normal;
                                  count = -1;
                                }
                                count++;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 6.0, bottom: 6.0, right: 6, left: 6),
                            child: Image.asset(
                              'assets/images/map_type.png',
                              scale: 3.5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                            onTap: () {
                           _getMyLocation();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 6.0, bottom: 6.0, right: 6, left: 6),
                              child: SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: Image.asset(
                                    "assets/images/gps.png",
                                  )),
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _addMarker(LatLng source, LatLng des, String address) async {
    // String pName = Constants.pname!;
    // if (_origin == null || (_origin != null && _destination != null)) {
    // Origin is not set OR Origin/Destination are both set
    // Set origin
    BitmapDescriptor patroller_start = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/bikegreen.png",
    );
    setState(() {
      _origin = Marker(
        markerId: const MarkerId('origin'),
        infoWindow: InfoWindow(title: address),
        icon: patroller_start,
        position: source,
      );
      // Reset destination
      _destination = null;

      // Reset info
    //  _info = null;
    });

/*    setState(() async {
      name = Constants.name!;
      _destination = Marker(
        markerId: const MarkerId('destination'),
        infoWindow: const InfoWindow(title: "Destination Location"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: des,
      );
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin!.position, destination: des);
      setState(() => _info = directions);
    });*/

    // setState(() {
    //   mapController!.animateCamera(
    //     _info != null
    //         ? CameraUpdate.newLatLngBounds(LatLngBounds(southwest: LatLng(sourceLat, sourceLng), northeast: LatLng(desLat, desLng)), 100.0)
    //         : CameraUpdate.newCameraPosition(initialCameraPosition),
    //   );
    // });
  }

  Widget _closeIconRow() {
    if (showPanelUpDown || (pc.isAttached && pc.isPanelClosed)) {
      return Container(
          //color: Colors.amber,
          padding: const EdgeInsets.all(0),
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  print('_closeIconRow');
                  onChangeSlideUpPanelStatus();
                },
                /*
                  icon: Icon(
                      this.widget.pc.isAttached && this.widget.pc.isPanelOpen
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      color: Colors.grey[500],
                      size: 30),
                  */
                icon: pc.isAttached && pc.isPanelOpen
                    ? Image.asset("assets/images/icons/downarrow.png")
                    : Image.asset("assets/images/icons/uparrow.png"),
              ),
            ],
          ));
    } else {
      return const SizedBox();
    }
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: [
            Container(
              child: ListView(
                physics: (pc.isAttached && pc.isPanelOpen)
                    ? const ScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                //shrinkWrap: true,
                controller: sc,
                children: <Widget>[
                  _closeIconRow(),
                 /* showMenuContainer
                      ?
                  getOnOpensheetItems()
                      : Center(
                          child: Text(
                              "Tap the arrow to see the Patroller's info",
                              style: TextStyle(
                                  fontSize: 8, color: Colors.black26))),*/
                ],
              ),
            ),
          ],
        ));
  }

  onChangeSlideUpPanelStatus() {
    print(
        'onChangeSlideUpPanelStatus - $_panelHeightOpen - ${MediaQuery.of(context).size.height} - $dynamicSlideUpPanelHeightOpenPercentage');

    setState(() {
      showMenuContainer = !showMenuContainer;
      // this.widget.pc.animatePanelToPosition(0.3);
    });
    initPanelController();
    if (showMenuContainer) {
      if (!anyScreenOpened) {
        dynamicSlideUpPanelHeightOpenPercentage = 0.4;
        dynamicSlideUpPanelHeightClosePercentage = 0.2;
      }
      pc.open();
    } else {
      pc.close();
    }
  }

  _getMyLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark place = placemarks[0];
    mCircle = {
      Circle(
        circleId: const CircleId("current Location"),
        center: LatLng(lat, long),
        strokeWidth: 2,
        strokeColor: ColorUtils.green1,
        radius: 100,
      ),
    };
    sourceAddress =
    "${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";
    _markers.add(Marker(
        markerId: const MarkerId('Current Locations'),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: '${sourceAddress}')));
    zoomVal = 16;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 15),
      ),
    );
    pc.close();
   // polylineCoordinates.add(LatLng(widget.la, -122.08832357078792));
    
  }
/*  getOnOpensheetItems() {
    return !isHistoricalView
        ? Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: checkDistance,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .45,
                        child: Row(
                          children: [
                            Text(
                              "Total Distance",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${GlobleConstant.totaldistance==null?0:GlobleConstant.totaldistance} km",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Duration",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${(GlobleConstant.duartions==null?0:(GlobleConstant.duartions))} mints",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${Constants.name}",
                          style: TextStyle(
                            color: ColorConstant.bluegray400,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.50,
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              13,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.38,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isHistoricalView = true;
                            });
                          },
                          child: Row(
                            children: [

                              SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Timer? timer;
                                  callLIVE();
                                  timer = Timer(
                                    const Duration(seconds: 60),
                                    () {
                                      callLIVE();
                                    },
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .22,
                                  height:
                                      MediaQuery.of(context).size.width * .08,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.cyan600,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        50.00,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "LIVE",
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .22,
                                height: MediaQuery.of(context).size.width * .08,
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray403,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      50.00,
                                    ),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  "Historical Track",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto'),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: getVerticalSize(
                  0.50,
                ),
                width: getHorizontalSize(
                  336.00,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray402,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                  *//*  SvgPicture.asset(
                      ImageConstant.imgVector4,
                      fit: BoxFit.fill,
                    ),*//*
                    SizedBox(
                      width: 12,
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImageConstant.imgVector5,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last Address",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: ColorConstant.bluegray400,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.50,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .80,
                              child: Text(
                                "${Constants.startAddress == null ? "Last address is not coming" : Constants.startAddress}",
                                softWrap: true,
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.38,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              *//*
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageConstant.imgVector5,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Text(
                      "Last Address",
                      textScaleFactor: 1,
                      style: TextStyle(
                        color: ColorConstant.bluegray400,
                        fontSize: getFontSize(
                          12,
                        ),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*.80,
                      child: Wrap(
                      children: [
                        Text(
                          //"${Constants.maintenancepoint==null?"NA":Constants.maintenancepoint}",
                          sourceAddress!,
                          softWrap: true,
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.38,
                          ),
                        ),
                      ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
*//*
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImageConstant.imgVector6,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "On: ${starttime == null ? "" : starttime}",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.50,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: checkDistance,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .45,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Total Distance",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: getFontSize(
                                            12,
                                          ),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          height: 1.50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${GlobleConstant.totaldistance==null?0:GlobleConstant.totaldistance} km",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: getFontSize(
                                            12,
                                          ),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          height: 1.50,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Duration",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: getFontSize(
                                            12,
                                          ),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          height: 1.50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${(GlobleConstant.duartions==null?0:(GlobleConstant.duartions))} mints",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: getFontSize(
                                            12,
                                          ),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          height: 1.50,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${Constants.name}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.50,
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: getVerticalSize(
                  0.50,
                ),
                width: getHorizontalSize(
                  336.00,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray402,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .80,
                        child: ListTile(
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2015),
                              lastDate: DateTime(2025),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                setState(() {
                                  _date = DateTimeUtils.checkTMontFormate(
                                      selectedDate.toString().split('.').first);
                                  datetime = selectedDate;
                                });
                              }
                            });
                          },
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Track @ Map",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: _darkTheme
                                      ? ColorConstant.whiteA700
                                      : ColorConstant.black900,
                                  fontSize: 11,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${_date == null ? "" : _date.toString().split(" ").first}",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                      color: _darkTheme
                                          ? ColorConstant.whiteA700
                                          : ColorConstant.black900,
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.date_range,
                                    size: 18.0,
                                    color: _darkTheme
                                        ? ColorConstant.whiteA700
                                        : ColorConstant.black900
                                            .withOpacity(.54),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .80,
                                child: Divider(
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showPanelUpDown = false;
                          print("datetime $datetime");

                          if (datetime == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: ColorConstant.gray403,
                              content: Text(
                                "Please select date first",
                                textScaleFactor: 1,
                                style: TextStyle(color: ColorConstant.black900),
                              ),
                            ));
                          } else {
                            final patrollerSaveBloc =
                                BlocProvider.of<AddPatrolllerBloc>(context);
                            patrollerSaveBloc.add(PatrollerRouteData(
                                patrollerid: Constants.liveid.toString(),
                                datetime:
                                    datetime.toString().split(" ").first));
                          }
                        },
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: ColorConstant.gray403,
                          child: Text(
                            "GO",
                            textScaleFactor: 1,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          );
  }
  getOnBottomSheetCloseItems() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: checkDistance,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          child: Row(
                            children: [
                              Text(
                                "Total Distance",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.50,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${GlobleConstant.totaldistance==null?0:GlobleConstant.totaldistance} km",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Duration",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.50,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${GlobleConstant.duartions==null?0:(GlobleConstant.duartions)} mints",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.50,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${Constants.name}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getFontSize(
                      12,
                    ),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isHistoricalView = true;
                      pc.open();

                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await FlutterPhoneDirectCaller.callNumber(
                              "+91 ${Constants.mobile}");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  color: ColorConstant.whiteA700,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: ColorConstant.circleyello,
                            child: Image.asset(
                              "assets/images/pCall.png",
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Timer? timer;
                            callLIVE();
                          timer = Timer(
                            const Duration(seconds: 60),
                                () {
                              callLIVE();
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .22,
                          height: MediaQuery.of(context).size.width * .08,
                          decoration: BoxDecoration(
                            color: ColorConstant.cyan600,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                50.00,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "LIVE",
                              textScaleFactor: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .22,
                        height: MediaQuery.of(context).size.width * .08,
                        decoration: BoxDecoration(
                          color: ColorConstant.cyan600,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              50.00,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Historical Track",
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> callLIVE() async {
    final patrollerSaveBloc = BlocProvider.of<AddPatrolllerBloc>(context);
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
    patrollerSaveBloc.add(LiveListdata(
        ccode: Constants.liveid.toString(),
        fields: "${formattedDate.toString()}"));
    // 2016-01-25
    *//*final patrollerSaveBloc =
    BlocProvider.of<AddPatrolllerBloc>(context);
    patrollerSaveBloc.add(PatrollerRouteData(
        patrollerid: Constants.liveid.toString(),
        datetime:formattedDate));
*//*
    pc.close();
  }
  _getMyLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark place = placemarks[0];
    mCircle = Set.from([
      Circle(
        circleId: CircleId("current Location"),
        center: LatLng(lat, long),
        strokeWidth: 2,
        strokeColor: ColorConstant.btncolor,
        radius: 100,
      ),
    ]);
    sourceAddress =
        "${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";
    _markers.add(Marker(
        markerId: MarkerId('Current Locations'),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: '${sourceAddress}')));
    zoomVal = 16;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 15),
      ),
    );
    pc.close();
  }
  Future<void> callPolygone(List<LatLng> polylineCoordinates2, int i) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        polylineCoordinates2[0].latitude, polylineCoordinates2[0].longitude);
    Placemark place = placemarks[0];
    String Address =
        "${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.subLocality}, ${place.country}";
    List<Placemark> EndAddress = await placemarkFromCoordinates(
        polylineCoordinates2[polylineCoordinates2.length - 1].latitude,
        polylineCoordinates2[polylineCoordinates2.length - 1].longitude);
    Placemark EndAddressplace = EndAddress[0];
    String endaddress =
        "${EndAddressplace.subAdministrativeArea}, ${EndAddressplace.administrativeArea},  ${place.subLocality},${EndAddressplace.country}";
    _markers.add(Marker(
      markerId: MarkerId('Start Point $i'),
      position: polylineCoordinates2[0],
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(title: Address, snippet: time),
    ));
    _markers.add(Marker(
      markerId: MarkerId('End Point $i'),
      position: polylineCoordinates2[polylineCoordinates2.length - 1],
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: endaddress,
      ),
    ));
    Polyline polyline = Polyline(
      polylineId: PolylineId('poly $i}'),
      points: polylineCoordinates2,
      color: ColorConstant.btncolor,
      jointType: JointType.round,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      width: 5,
      visible: true,
    );
    _polylines.add(polyline);
    pc.close();
  }*/
  }
