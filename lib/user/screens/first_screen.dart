import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:ev_feul/bloc/login/login_bloc.dart';
import 'package:ev_feul/user/screens/profile.dart';
import 'package:ev_feul/user/screens/sign_in.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController _userIdController =
      TextEditingController(text: 'N17160933');
  final TextEditingController _passwordController =
      TextEditingController(text: 'N!lesh@@');
  late bool _validate;
  late bool isLogin;
  bool hidePassword = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var circleRadius = 60;
  String versionCode = "";
  bool isInternetConnected = false;
  late LoginBloc loginBloc;

  // internet
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _validate = false;
    isLogin = false;
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    _connectivitySubscription.cancel();
    super.deactivate();
  }

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
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
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
                                      return Profile();
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginNow()),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .60,
                                height:
                                    MediaQuery.of(context).size.height * .06,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
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
                            Builder(
                              builder: (context) {
                                return GestureDetector(
                                  onTap:(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()),
                                    );
                                },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * .60,
                                    height: MediaQuery.of(context).size.height * .06,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                        gradient: LinearGradient(
                                          colors: [
                                            ColorUtils.Create1ln,
                                            ColorUtils.Create2ln,
                                          ],
                                        )),
                                    child: const Center(
                                      child: Text(
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
                                );
                              }
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
            ),
          ],
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(
      value,
      style: const TextStyle(color: Colors.red, fontSize: 16),
    )));
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() {
          isInternetConnected = true;
        });
        loginBloc.add(InternetConnectionStatus(internetStatus: true));
        break;
      case ConnectivityResult.mobile:
        setState(() {
          isInternetConnected = true;
        });
        loginBloc.add(InternetConnectionStatus(internetStatus: true));
        break;
      case ConnectivityResult.none:
        setState(() {
          isInternetConnected = false;
          _connectionStatus = result.toString();
        });
        loginBloc.add(InternetConnectionStatus(internetStatus: false));

        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }


}
