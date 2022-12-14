import 'dart:async';

import 'package:ev_feul/bloc/login/login_bloc.dart';
import 'package:ev_feul/tabs/tabspage.dart';
import 'package:ev_feul/user/screens/profile.dart';
import 'package:ev_feul/user/screens/registernow_in.dart';
import 'package:ev_feul/user/screens/sign_in.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class LoginScreenMain extends StatefulWidget {
  const LoginScreenMain({Key? key}) : super(key: key);
  @override
  State<LoginScreenMain> createState() => _LoginScreenMainState();
}
class _LoginScreenMainState extends State<LoginScreenMain> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(LoginInitial()),
      child: const LoginWidget(),
    );
  }
}
class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}
class _LoginWidgetState extends State<LoginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late bool isLogin;
  bool hidePassword = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var circleRadius = 60;
  String versionCode = "";
  bool isInternetConnected = false;
  late LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/images/spalsh_bg.png",
                  fit: BoxFit.fill,
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) async {},
                child: BlocBuilder(
                  bloc: loginBloc,
                  builder: (BuildContext context, LoginState state) {
                    if (state is LoginLoding) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 32),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 32),
                              height: 70.0,
                              width: 70.0,
                              child: CircularProgressIndicator(
                                backgroundColor:
                                ColorUtils.menu_selected_color,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is LoginInitial) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return const Profile();
                                  }),
                                );
                              },
                              child: Container(
                                color: Colors.transparent,
                                width:
                                MediaQuery.of(context).size.width * .42,
                                height:
                                MediaQuery.of(context).size.height * .42,
                                child: Image.asset(
                                  "assets/images/logo.png",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "USER LOGIN",
                            textScaleFactor: 1,
                            style: headingStyle,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap:(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignIn()),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .60,
                              height:
                              MediaQuery.of(context).size.height * .06,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorUtils.green1ln,
                                      ColorUtils.green2ln,
                                    ],
                                  )),
                              child: const Center(
                                child: Text(
                                  "Log in Now",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "OR",
                            textScaleFactor: 1,
                            style: headingStyle,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .60,
                            height: MediaQuery.of(context).size.height * .06,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                                gradient: LinearGradient(
                                  colors: [
                                    ColorUtils.Create1ln,
                                    ColorUtils.Create2ln,
                                  ],
                                )),
                            child:  Center(
                              child: GestureDetector(
                                onTap:(){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  TabsPage(selectedIndex: 0,)),
                                  );
                                },
                                child: const Text(
                                  "Create A Account",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
