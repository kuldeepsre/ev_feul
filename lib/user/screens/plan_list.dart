import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/model/my_plan_response.dart';
import 'package:ev_feul/utils/constants.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class PlanList extends StatefulWidget {
  const PlanList({Key? key}) : super(key: key);

  @override
  _GateScreenState createState() => _GateScreenState();
}

class _GateScreenState extends State<PlanList> {
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

  PlanResponse ? planList;

  var differenceInDays=0;
  @override
  void initState() {
    super.initState();
    _validate = false;
    isLogin = false;

    final gateBloc = BlocProvider.of<GateBloc>(context);
    //   gateBloc.add(SaveFamily(data: list));
    gateBloc.add(GetPlanList(id: Constants.userId));
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
            if (state is PlanDataLoaded) {
              setState(() {
                //  plist.clear();
                planList = state.planList;


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

                        const SizedBox(height: 30,),
                        Center(child: Text("My Plans",textScaleFactor: 1,style:sideMenuStyle,)),
                        const SizedBox(height: 30,),
                        Card(
                          elevation: 15,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              side: BorderSide(width: 1, color: Colors.white)),
                          child: Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 30),
                                child: Column(
                                  children: [
                                planList!=null?
                                ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 1,
                                      itemBuilder: (context, i){
                                        return  Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: <Widget>[

                                              Card(
                                                elevation: 5,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        bottomRight: Radius.circular(1),
                                                        bottomLeft: Radius.circular(1),
                                                        topLeft: Radius.circular(1),
                                                        topRight: Radius.circular(1)),
                                                    side: BorderSide(width:1, color: Colors.white)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      Container(


                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(1)   ,
                                                            gradient: LinearGradient(
                                                              colors: [
                                                                i%2==0? ColorUtils.greenbtn: ColorUtils.btnBlue,
                                                                i%2==0? ColorUtils.greenbtn: ColorUtils.btnBlue,


                                                              ],
                                                            )

                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Column(
                                                            children: [
                                                              Center(child: Text("Package Name: ${GlobleConstant.planName}",textScaleFactor: 1,style:sideMenuStyle,)),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 20,),
                                                      Center(child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text("${GlobleConstant.totalSwap} Batteries Consumed",textScaleFactor: 1,style:sideMenuBlack,),
                                                        ],
                                                      )),
                                                      const SizedBox(height: 40,),
                                                    ],
                                                  ),
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
                                                        i%2==0? ColorUtils.redColor: ColorUtils.redColor,
                                                        i%2==0? ColorUtils.redColor: ColorUtils.redColor,


                                                      ],
                                                    )

                                                    ),

                                                    child:  Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                        child:  Text(
                                                          "Expired in ${GlobleConstant.differenceInDays} days ",
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
                                        );
                                      },
                                    )
                                   :Center(child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text("No Plans Found !!!"),
                                   ))
                                  ],
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