// ignore_for_file: prefer_const_constructors

import 'package:ev_feul/custom_widget/custom_button.dart';
import 'package:ev_feul/custom_widget/custom_text_blue.dart';
import 'package:ev_feul/custom_widget/custom_text_normal.dart';
import 'package:ev_feul/custom_widget/custom_text_white_normal.dart';
import 'package:ev_feul/tabs/home_scrrem.dart';
import 'package:ev_feul/tabs/tabspage.dart';
import 'package:ev_feul/user/screens/sign_in.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/strings.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';

import 'drawermenunav.dart';

class RegisterNow extends StatefulWidget {
  const RegisterNow({Key? key}) : super(key: key);

  @override
  State<RegisterNow> createState() => _RegisterNowState();
}

class _RegisterNowState extends State<RegisterNow> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late bool _validate;
  late bool isLogin;
  var selectProject = "";
  final statusDateControoler = TextEditingController();

  var emailController = TextEditingController(text: "");
  var passController = TextEditingController(text: "");

  var idController=TextEditingController(text: "");
  var addressController=TextEditingController(text: "");
  var phoneController=TextEditingController(text: "");
  var ownerController=TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(

          backgroundColor: Colors.white,
          body:Stack(

            children: [

              Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  <Widget>[
                      SizedBox(
                        width:MediaQuery.of(context).size.width,
                        height:MediaQuery.of(context).size.height*.30,
                        child: Image.asset("assets/images/login.png",fit: BoxFit.fill,),
                      ),
                      Text(
                        "Register Now".toUpperCase(),
                        textScaleFactor: 1,
                        style: blueTextStyle,
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        "Please Register to get credential",
                        textScaleFactor: 1,
                        style: listTextStyle,
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            TextFormField(
                              controller: ownerController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorUtils.textFill,


                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue,
                                        width: 0.5) //This is Ignored,

                                ),

                                labelStyle: TextStyle(
                                    color: ColorUtils.bgText),
                                hintText: "",
                                labelText: "Owner Name",
                                hintStyle: const TextStyle(color: Colors.white),
                              ),

                              autocorrect: true,
                              style:
                             listTextStyle,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Owner Name";
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
                                filled: true,
                                fillColor: ColorUtils.textFill,

                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue,
                                        width: 0.5) //This is Ignored,

                                ),
                                labelStyle: TextStyle(
                                    color: ColorUtils.bgText),
                                hintText: "",
                                labelText: "Password",

                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                              autocorrect: true,
                              style:
                             listTextStyle,
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
                            TextFormField(
                              controller: idController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorUtils.textFill,

                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue,
                                        width: 0.5) //This is Ignored,

                                ),
                                labelStyle: TextStyle(
                                    color: ColorUtils.bgText),
                                hintText: "",
                                labelText: "Owner ID Proof any",
                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                              autocorrect: true,
                              style:
                             listTextStyle,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter Owner ID Proof any";
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
                            TextFormField(
                              controller: addressController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorUtils.textFill,

                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue,
                                        width: 0.5) //This is Ignored,

                                ),
                                labelStyle: TextStyle(
                                    color: ColorUtils.bgText),
                                hintText: "",
                                labelText: "Address",
                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                              autocorrect: true,
                              style:
                             listTextStyle,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Address";
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
                            TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorUtils.textFill,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue,
                                        width: 0.5) //This is Ignored,

                                ),
                                labelStyle: TextStyle(
                                    color: ColorUtils.bgText),
                                hintText: "",
                                labelText: "Phone Number",
                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                              autocorrect: true,
                              style:
                             listTextStyle,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Phone Number";
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
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorUtils.textFill,

                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorUtils.btnBlue,
                                        width: 0.5) //This is Ignored,

                                ),
                                labelStyle: TextStyle(
                                    color: ColorUtils.bgText),
                                hintText: "",
                                labelText: "Email ID",
                                hintStyle: const TextStyle(color: Colors.white),
                              ),
                              autocorrect: true,
                              style:
                             listTextStyle,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email ID";
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
                                child: const CustomTextWhiteNormal(Strings.forgotPass)),
                            const SizedBox(height: 10,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: CustomButton("Register", onClick: () {
                             //   save(context);
                              /*   if (formKey.currentState!.validate()){

                              }*/
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  MyStatefulWidget()),
                                );

                              }, isFullWidth: true),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Text(Strings.account,textScaleFactor: 1,style: listTextStyle,),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SignIn()),
                                              (Route<dynamic> route) => route.isFirst);
                                    },
                                    child: CustomTextBlue(Strings.login)),
                              ],
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          )),
    );

  }



}
