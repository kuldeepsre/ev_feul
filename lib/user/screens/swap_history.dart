import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class SwapHistory extends StatefulWidget {
  const SwapHistory({Key? key}) : super(key: key);

  @override
  _GateScreenState createState() => _GateScreenState();
}

class _GateScreenState extends State<SwapHistory> {
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
                        SizedBox(height: 30,),
                        Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              side: BorderSide(width: 1, color: Colors.white)),
                          child: Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 30),
                                child: Card(
                                  elevation: 15,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      side: BorderSide(width: 1, color: Colors.black)),
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 15,
                                        child: Container(

                                          decoration: BoxDecoration(
                                            color: ColorUtils.tablleHColor,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                                              children: [
                                                Text("Date",textScaleFactor:1,style: sideMenu14Style,),
                                                Text("Battery Serial No",textScaleFactor:1,style: sideMenu14Style,),
                                                Text("Swap Date",textScaleFactor:1,style: sideMenu14Style,),
                                                Text("EV. No",textScaleFactor:1,style: sideMenu14Style,),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: 100,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Container(

                                            color:( index%2==0)?Colors.white:ColorUtils.even,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                                children: [
                                                  Text("24 Nov 22",style: buttonBlackTextStyle,),
                                                  Text("#786542",style: buttonBlackTextStyle,),
                                                  Text("24 Nov 22",style: buttonBlackTextStyle,),
                                                  Text("#786542",style: buttonBlackTextStyle,),



                                                ],
                                              ),
                                            ),
                                          )
                                          ;
                                        },
                                        separatorBuilder: (context, index) {
                                          return Divider(thickness: 0.5,);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )

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