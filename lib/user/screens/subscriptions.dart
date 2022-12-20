import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/model/subscreptions_response.dart';
import 'package:ev_feul/utils/Constants.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/custom_dialog.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({Key? key}) : super(key: key);

  @override
  _GateScreenState createState() => _GateScreenState();
}

class _GateScreenState extends State<SubscriptionPlan> {
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
  _SubscriptionPlanState createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<Gate2Widget> {
  List<SuccessData> subscriptionList = [];

  @override
  void initState() {
    super.initState();
    final gateBloc = BlocProvider.of<GateBloc>(context);
    //   gateBloc.add(SaveFamily(data: list));
    gateBloc.add(GetSubscriptionList(id: Constants.userId));
  }

  @override
  Widget build(BuildContext context) {
    final gateBloc = BlocProvider.of<GateBloc>(context);
    return BlocListener<GateBloc, GateState>(
      listener: (context, state) {
        if (state is UserTokenExpired) {
          CustomDialogs.showDialogRedirctLogin(
              context, state.message, state.title);
        }

        if (state is SearchDataLoaded) {
          setState(() {
            //  plist.clear();
            subscriptionList = state.subscriptionList;
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
                  child: Image.asset(
                    "assets/images/bg.png",
                    fit: BoxFit.fill,
                  )),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      "Subscription Plan",
                      textScaleFactor: 1,
                      style: sideMenuStyle,
                    )),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: subscriptionList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var model = subscriptionList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 30),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Card(
                                  elevation: 5,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                      side: BorderSide(
                                          width: 1, color: Colors.white)),
                                  child: Column(
                                    children: [
                                      Card(
                                        color:ColorUtils.greenbtn,
                                        shape: const RoundedRectangleBorder(

                                            borderRadius: BorderRadius.only(

                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15)),
                                            side: BorderSide(
                                                width: 1, color: Colors.white)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Center(
                                                  child: Text(
                                                "${model.planName}",
                                                textScaleFactor: 1,
                                                style: listTextStyle,
                                              )),
                                              Center(
                                                  child: Text(
                                                "${model.description}",
                                                textScaleFactor: 1,
                                                style: listTextStyle,
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                         Card(
                                        color:ColorUtils.greenbtn,
                                        shape: const RoundedRectangleBorder(

                                            borderRadius: BorderRadius.only(

                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15)),
                                            side: BorderSide(
                                                width: 1, color: Colors.white)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Center(
                                                  child: Text(
                                                "Plan 999",
                                                textScaleFactor: 1,
                                                style: listTextStyle,
                                              )),
                                              Center(
                                                  child: Text(
                                                "( ideal for 30+ swaps )",
                                                textScaleFactor: 1,
                                                style: listTextStyle,
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Container(

                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border.all(width: 5.0, color: Colors.white),
                                            borderRadius: BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                              colors: [
                                                ColorUtils.grey,
                                                ColorUtils.whiteColor,
                                              ],
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 18.0),
                                          child: Column(
                                            children: [
                                              Center(
                                                  child: Text(
                                                "Rate per Swap : ₹ ${model.ratePerSwap}",
                                                textScaleFactor: 1,
                                                style: listTextStyle,
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Center(
                                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Free Swaps: ${model.freeSwap}",
                                            textScaleFactor: 1,
                                            style: sideMenuBlack,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                         Icon(Icons.list)
                                        ],
                                      )),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 50),
                                    child: GestureDetector(onTap: (){

                                      /*final gateBloc = BlocProvider.of<GateBloc>(context);
    //   gateBloc.add(SaveFamily(data: list));
    gateBloc.add(GetSubscriptionList(id: Constants.userId));*/

                                    },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height * .06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(15)),
                                            gradient: LinearGradient(
                                              colors: [
                                                ColorUtils.greenbtn,
                                                ColorUtils.greenbtn,
                                              ],
                                            )),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: const Text(
                                              "Subscribe Now",
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
                                  ),
                                  right: 0,
                                  left: 0,
                                  bottom: -20,
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
