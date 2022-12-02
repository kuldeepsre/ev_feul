import 'package:ev_feul/bloc/login/login_bloc.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
 class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(LoginInitial()),
      child: const LoginScreen(),
    );
  }
}

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late bool _validate;
  late bool isLogin;
  var selectProject = "";
  final statusDateControoler = TextEditingController();

  @override
  void initState() {
    super.initState();
    _validate = false;
    isLogin = false;
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: ColorUtils.app_primary_color,
          title: const Text("Construction"),
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            /*       if (state is UserTokenExpired) {
              CustomDialogs.showDialogRedirctLogin(
                  context, state.message, state.title);
            }
            if (state is ConstructionDataSaved) {
              CustomDialogs.showDialogMessageSiteProgressPhoto(
                  context,
                  "Construction data has been successfully added!",
                  "Construction  ");
              Future.delayed(Duration(seconds: 3), () {
                LoginBloc.add(ConstructionEventInitial());
              });
            }*/
          },
          child: BlocBuilder(
            bloc: loginBloc,
            builder: (BuildContext context, LoginState state) {
              if (state is LoginLoding) {
                return const CustomLoader();
              }

              return Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[Text("")],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
