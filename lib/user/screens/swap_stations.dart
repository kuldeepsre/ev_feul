import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




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
  @override
  void initState() {
    super.initState();
    _validate = false;
    isLogin = false;

    final gateBloc = BlocProvider.of<GateBloc>(context);
    gateBloc.add(ParkingDataData(master_name: "parking_allotment"));
    gateBloc.add(ParkingGetListData(parking_allotment: " "));
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
                      children:  <Widget>[

                        Center(child: Text("Swap Stations",textScaleFactor: 1,style:sideMenuStyle,)),
                        SizedBox(height: 30,),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (context, i){
                            return  Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Card(
                                elevation: 5,
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
                                    padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 3),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
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

                                        ListTile(

                                          leading: Icon(Icons.directions,color: Colors.green,),
                                          title: Text("Get Direction",softWrap: true,textScaleFactor: 1,style:graySubHeadingStyle,),
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


}