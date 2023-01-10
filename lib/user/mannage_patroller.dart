

import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/model/firebase_response.dart';
import 'package:ev_feul/model/lat_long_response.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/constants.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:cron/cron.dart';

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
      child:  _PatrollerFormStateWidget(
        lat: widget.lat,
        long: widget.long,
        patrollerId: widget.patrollerId,

      ),
    );
  }
}

class _PatrollerFormStateWidget extends StatefulWidget {
  String lat, long, patrollerId;

   _PatrollerFormStateWidget(
      {Key? key,
        required this.lat,
        required this.long,
        required this.patrollerId,
        })
      : super(key: key);
  @override
  _PatrollerFormStateWidgetState createState() =>
      _PatrollerFormStateWidgetState();
}

class _PatrollerFormStateWidgetState extends State<_PatrollerFormStateWidget> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  late bool _validate;


  static double CAMERA_ZOOM = 12;
  static double CAMERA_TILT = 90;
  static double CAMERA_BEARING = 0;
  LatLng mapPosition = const LatLng(23.8021939, 86.3642084);
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
  double sourceLat = 30.7352102,
      sourceLng = 76.6934878,
      desLat = 0,
      desLng = 0;
  CameraPosition? initialCameraPosition;

  //     zoom: CAMERA_ZOOM,
  //     zoom: 9,
  //     tilt: CAMERA_TILT,
  //     bearing: CAMERA_BEARING,
  //     target: SOURCE_LOCATION);
  // target: LatLng(23.5385134, 87.3512902));
  String? name;

  String? sourceAddress = "NA",
      lastAddress = "NA";

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

  double distance = 0.0;

  FirbaseResponse ? firbaseResponse;

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
    _getMyLocation();
    background();
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
                ColorUtils.blue1,
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
                    color: Colors.white,
                    size: 14,
                  ),
                  Text(
                    "Back",
                    textScaleFactor: 1,
                    style: TextStyle(
                        color: Colors.white,
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
          if(state is LiveDataLoaded){
            setState(() {
              firbaseResponse=  state.firbaseResponse;
              widget.lat=firbaseResponse!.latitude.toString();
              widget.long=firbaseResponse!.longitude.toString();
              _getMyLocation();
            });
          }
        },
        child: BlocBuilder(
          bloc: patrollerSaveBloc,
          builder: (BuildContext context, GateState state) {
            if (state is GateLoading) {
              return SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: SlidingUpPanel(
                  controller: pc,
                  maxHeight: MediaQuery
                      .of(context)
                      .size
                      .height * .29,
                  minHeight: MediaQuery
                      .of(context)
                      .size
                      .height * .10,
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
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0)),
                  onPanelSlide: (double pos) =>
                      setState(() {
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
          EdgeInsets.only(bottom: MediaQuery
              .of(context)
              .size
              .height * .16),
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
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    margin: const EdgeInsets.only(
                        top: 250, bottom: 20, right: 10),
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
                    ? const Icon(Icons.keyboard_arrow_down_outlined)
                    : const Icon(Icons.keyboard_arrow_up),
              ),


            ],
          ));
    }
    else {
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
                  showMenuContainer
                      ?
                  getOnOpensheetItems()
                      : const Center(
                      child: const Text(
                          "Tap the arrow to see the Patroller's info",
                          style: TextStyle(
                              fontSize: 8, color: Colors.black26))),
                ],
              ),
            ),
          ],
        ));
  }

  onChangeSlideUpPanelStatus() {
    print(
        'onChangeSlideUpPanelStatus - $_panelHeightOpen - ${MediaQuery
            .of(context)
            .size
            .height} - $dynamicSlideUpPanelHeightOpenPercentage');

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
    "${place.name},${place.street},${place.subLocality},${place.subThoroughfare},${place.subAdministrativeArea}, ${place.administrativeArea}, ${place
        .country}";
    _markers.add(Marker(
        markerId: const MarkerId('Current Locations'),
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: '$sourceAddress')));
    zoomVal = 8;
    double ? latitude = double.tryParse(widget.lat.toString());
    double ? longitude = double.tryParse(widget.long.toString());
    List<Placemark> placemarks2 = await placemarkFromCoordinates(latitude!, longitude!);
    Placemark place2 = placemarks2[0];
    var _destinationAddress =
    "${place2.name},${place2.street},${place2.subLocality},${place2.subThoroughfare},${place2.subAdministrativeArea}, ${place2.administrativeArea}, ${place2
        .country}";
    BitmapDescriptor patrollerLastAddress =
    await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      "assets/images/bikegreen.png",
    );
    _markers.add(Marker(
      markerId: const MarkerId('End Point'),
      position: LatLng(latitude, longitude),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: "$_destinationAddress",
      ),
    ));
    polylineCoordinates.add(LatLng(lat, long));
    polylineCoordinates.add(LatLng(latitude, longitude));
    Polyline polyline = Polyline(
      polylineId: const PolylineId('poly }'),
      points: polylineCoordinates,
      color: Colors.lightBlue,
      jointType: JointType.round,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      width: 1,
      visible: true,
    );
    _polylines.add(polyline);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 7),
      ),
    );
    double  roundDistanceMeter = Geolocator.distanceBetween(lat, long, latitude, longitude);
    double distanceInKiloMeters = roundDistanceMeter / 1000;
    distance =
    double.parse((distanceInKiloMeters).toStringAsFixed(2));
  }

     getOnOpensheetItems() async {
      return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Name",textScaleFactor: 1,style: listItemTitleStyle,),
                const SizedBox(width: 10,),
                Text(GlobleConstant.loginResponse!.success!.userData!.ownerName.toString())

              ]),
          const SizedBox(width: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Email",textScaleFactor: 1,style: listItemTitleStyle,),
                const SizedBox(width: 10,),
                Text(GlobleConstant.loginResponse!.success!.userData!.email.toString())

              ]),
          const SizedBox(width: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Text("Phone",textScaleFactor: 1,style: listItemTitleStyle,),
                const SizedBox(width: 10,),
                Text(GlobleConstant.loginResponse!.success!.userData!.phone.toString())

              ]),
          const SizedBox(width: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Text("Total Distance",textScaleFactor: 1,style: listItemTitleStyle,),
                const SizedBox(width: 10,),
                Text("$distance KM")

              ]),
          const SizedBox(width: 10,),


        ],
      ),
    );
  }

  void background() {
    final cron = Cron();
    cron.schedule(Schedule.parse('*/1 * * * *'), () async {
      final gateBloc = BlocProvider.of<GateBloc>(context);
         gateBloc.add(GetLiveData(id: widget.patrollerId));
    });
  }

}