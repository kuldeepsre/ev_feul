// ignore_for_file: prefer_const_constructors

import 'package:ev_feul/custom_widget/custom_button.dart';
import 'package:ev_feul/custom_widget/custom_text_blue.dart';

import 'package:ev_feul/custom_widget/custom_text_normal.dart';
import 'package:ev_feul/tabs/home_scrrem.dart';
import 'package:ev_feul/user/screens/registernow_in.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/strings.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  <Widget>[


                Container(
                  width:MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*.30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/loginlogo.png",fit: BoxFit.fill,),
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  "Login Now".toUpperCase(),
                  textScaleFactor: 1,
                  style: blueTextStyle,
                ),
                const SizedBox(height: 20,),
                Text(
                  "Please login to get started",
                  textScaleFactor: 1,
                  style: graySubHeadingStyle,
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hoverColor: ColorUtils.fillColor,
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

                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: passController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hoverColor: ColorUtils.fillColor,
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
                      const SizedBox(height: 10,),

                      Align(
                          alignment: Alignment.topRight,
                          child: const CustomTextBlue(Strings.forgotPass)),
                      const SizedBox(height: 10,),

                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CustomButton(Strings.save, onClick: () {
                         save(context);
                         /* if (formKey.currentState!.validate()){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  TabsPage(selectedIndex: 0)),
                            );
                          }*/
                        }, isFullWidth: true),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          CustomTextNormal(Strings.noAccount),
                          GestureDetector(
                              onTap: (){
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            RegisterNow()),
                                        (Route<dynamic> route) => route.isFirst);
                              },
                              child: CustomTextBlue(Strings.registerNow)),
                        ],
                      )
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      )
    );
  }

  void save(BuildContext context) {
    print("HI");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                Dashboard()),
            (Route<dynamic> route) => route.isFirst);
/*    MaterialPageRoute(builder: (context) => Dashboard());*/
  }
}