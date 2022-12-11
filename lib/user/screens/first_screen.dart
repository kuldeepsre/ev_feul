import 'dart:async';

import 'package:ev_feul/bloc/login/login_bloc.dart';
import 'package:ev_feul/custom_widget/custom_button.dart';
import 'package:ev_feul/tabs/tabspage.dart';
import 'package:ev_feul/user/screens/home.dart';
import 'package:ev_feul/user/screens/profile.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/navigation_service.dart';
import 'package:ev_feul/utils/route_constants.dart';
import 'package:ev_feul/utils/strings.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';


class LoginScreenMain extends StatefulWidget {
  const LoginScreenMain({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenMain> {
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
  final TextEditingController _userIdController = TextEditingController(text:'N17160933');
  final TextEditingController _passwordController = TextEditingController(text: 'N!lesh@@');
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
        resizeToAvoidBottomInset:false,
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),

          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    HexColor("#4ECDC4"),
                    HexColor("#556270"),
                  ],
                )
            ),

            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) async {

              },
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
                              backgroundColor: ColorUtils.menu_selected_color,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is LoginInitial) {
                    return Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return Profile();
                                }),
                              );
                            },
                            child: SizedBox(
                              width:MediaQuery.of(context).size.width*.42,
                              height:MediaQuery.of(context).size.height*.32,
                              child:Image.asset(
                                "assets/images/ril_logo.png",
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const LoginNow();
                                }),
                              );
                            },
                            child: SizedBox(
                              width:MediaQuery.of(context).size.width*.42,
                              height:MediaQuery.of(context).size.height*.32,
                              child:Image.asset(
                                "assets/images/ril_logo.png",
                              ),
                            ),
                          ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: CustomButton(Strings.save, onClick: () {
                                _onSaveClick(context);
                              }, isFullWidth: true),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
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

  void _onSaveClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const LoginNow();
      }),
    );
  }
}

