import 'package:ev_feul/custom_widget/custom_text_blue.dart';
import 'package:ev_feul/user/screens/registernow_in.dart';
import 'package:ev_feul/user/screens/sign_in.dart';

import '../../bloc/login/login_bloc.dart';
import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/custom_text_bold.dart';
import '../../custom_widget/custom_text_normal.dart';
import '../../utils/color_utils.dart';
import '../../utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginNow extends StatefulWidget {
  const LoginNow({Key? key}) : super(key: key);


  @override
  _LoginNowState createState() => _LoginNowState();
}
 class _LoginNowState extends State<LoginNow> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(LoginInitial()),
      child:  const LoginNow(),
    );
  }
}

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginNow> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late bool _validate;
  late bool isLogin;
  var selectProject = "";
  final statusDateControoler = TextEditingController();

  var emailController=TextEditingController(text: "");
  var passController=TextEditingController(text: "");

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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  <Widget>[
                          SizedBox(
                            height:MediaQuery.of(context).size.height*.20,
                            child: Image.asset("assets/images/login_hrd1.png"),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: ColorUtils.fillColor,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorUtils.app_primary_color)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorUtils.app_primary_color,
                                      width: 0.5) //This is Ignored,

                              ),
                              labelStyle: TextStyle(
                                  color: ColorUtils.app_primary_color),
                              hintText: "",
                              labelText: "Userid/Email",
                              hintStyle: const TextStyle(color: Colors.black),
                            ),

                            autocorrect: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter Email Id";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (text) {
                              setState(() {});
                              // do something with text
                            },
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: passController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              fillColor: ColorUtils.fillColor,

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorUtils.app_primary_color)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorUtils.app_primary_color,
                                      width: 0.5) //This is Ignored,

                              ),
                              labelStyle: TextStyle(
                                  color: ColorUtils.app_primary_color),
                              hintText: "",
                              labelText: "Password",
                              hintStyle: const TextStyle(color: Colors.black),
                            ),
                            autocorrect: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (text) {
                              setState(() {});
                              // do something with text
                            },
                          ),
                        /*  const SizedBox(height: 20,),
                          const CustomTextBold(Strings.forgotPass),*/
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: CustomButton(Strings.save, onClick: () {
                              if (formKey.currentState!.validate()){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignIn()),
                                );
                              }

                            }, isFullWidth: true),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:  [
                              CustomTextNormal(Strings.noAccount),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const RegisterNow()),
                                    );
                                  },
                                  child: CustomTextBlue(Strings.registerNow)),
                            ],
                          )
                        ],
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
