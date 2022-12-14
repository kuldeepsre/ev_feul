// ignore_for_file: prefer_const_constructors

import 'package:ev_feul/custom_widget/custom_button.dart';
import 'package:ev_feul/custom_widget/custom_text_blue.dart';
import 'package:ev_feul/custom_widget/custom_text_normal.dart';
import 'package:ev_feul/user/screens/sign_in.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/strings.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/loginlogo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Register Now".toUpperCase(),
                    textScaleFactor: 1,
                    style: blueTextStyle,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Please Register to get credential",
                    textScaleFactor: 1,
                    style: graySubHeadingStyle,
                  ),
                  const SizedBox(
                height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Card(
                          color: ColorUtils.fillColor,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: ColorUtils.fillColor,
                                fillColor: ColorUtils.fillColor,
                                enabled: false,
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                    color: ColorUtils.app_primary_color),
                                hintText: "",
                                labelText: "EV Number",
                                  hintStyle: const TextStyle(color: Colors.black),
                                errorStyle: redheadingStyle
                              ),
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter EV Number";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {});
                                // do something with text
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Card(
                          color: ColorUtils.fillColor,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: ColorUtils.fillColor,
                                fillColor: ColorUtils.fillColor,
                                enabled: false,
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                    color: ColorUtils.app_primary_color),
                                hintText: "",
                                labelText: "Password",
                                  hintStyle: const TextStyle(color: Colors.black),
                                errorStyle: redheadingStyle
                              ),
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Password";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {});
                                // do something with text
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Card(
                          color: ColorUtils.fillColor,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: ColorUtils.fillColor,
                                fillColor: ColorUtils.fillColor,
                                enabled: false,
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                    color: ColorUtils.app_primary_color),
                                hintText: "",
                                labelText: "Confirm Password",
                                  hintStyle: const TextStyle(color: Colors.black),
                                errorStyle: redheadingStyle
                              ),
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Confirm Password";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {});
                                // do something with text
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Card(
                          color: ColorUtils.fillColor,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: ColorUtils.fillColor,
                                fillColor: ColorUtils.fillColor,
                                enabled: false,
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                    color: ColorUtils.app_primary_color),
                                hintText: "",
                                labelText: "Owner Name",
                                  hintStyle: const TextStyle(color: Colors.black),
                                errorStyle: redheadingStyle,
                                errorText: "ffffff"

                              ),
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Owner Name";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {});
                                // do something with text
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Card(
                          color: ColorUtils.fillColor,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: TextFormField(
                                    controller: passController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hoverColor: ColorUtils.fillColor,
                                      fillColor: ColorUtils.fillColor,

                                      /*       focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorUtils.whiteColor)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorUtils.whiteColor,
                                          width: 0.5) //This is Ignored,

                                  ),*/
                                      labelStyle: TextStyle(
                                          color: ColorUtils.app_primary_color),
                                      hintText: "",
                                      labelText: "EV RC Copy",
                                      border: InputBorder.none,
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    autocorrect: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "EV RC Copy  Cannot be null";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      setState(() {});
                                      // do something with text
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Browse",
                                      textScaleFactor: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                      height: 2,
                        ),
                        Card(
                          color: ColorUtils.fillColor,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: TextFormField(
                                    controller: passController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hoverColor: ColorUtils.fillColor,
                                      fillColor: ColorUtils.fillColor,
                                      enabled: false,
                                      border: InputBorder.none,

                                      /*       focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorUtils.whiteColor)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorUtils.whiteColor,
                                          width: 0.5) //This is Ignored,

                                  ),*/
                                      labelStyle: TextStyle(
                                          color: ColorUtils.app_primary_color),
                                      hintText: "",
                                      labelText: "ID Proof",
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    autocorrect: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "ID Proof Cannot be null";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      setState(() {});
                                      // do something with text
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Browse",
                                      textScaleFactor: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                      height: 2,
                        ),
                        Card(
                          color: ColorUtils.fillColor,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: TextFormField(
                                    controller: passController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hoverColor: ColorUtils.fillColor,
                                      fillColor: ColorUtils.fillColor,
                                      enabled: false,
                                      border: InputBorder.none,

                                      /*       focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorUtils.whiteColor)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorUtils.whiteColor,
                                          width: 0.5) //This is Ignored,

                                  ),*/
                                      labelStyle: TextStyle(
                                          color: ColorUtils.app_primary_color),
                                      hintText: "",
                                      labelText: "Vehicle Photo",
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    autocorrect: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Vehicle Photo Cannot be null";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      setState(() {});
                                      // do something with text
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Browse",
                                      textScaleFactor: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                      height: 2,
                        ),
                        Card(
                          color: ColorUtils.fillColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8.0),
                            child: TextField(
                              controller: passController,
                              textAlign: TextAlign.justify,
                              maxLines: null,
                              expands: true,
                              keyboardType: TextInputType.text,

                              decoration: InputDecoration(
                                hoverColor: ColorUtils.fillColor,
                                fillColor: ColorUtils.fillColor,
                                enabled: false,
                                border: InputBorder.none,

                                /*       focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorUtils.whiteColor)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorUtils.whiteColor,
                                          width: 0.5) //This is Ignored,

                                  ),*/
                                labelStyle: TextStyle(
                                    color: ColorUtils.app_primary_color),
                                hintText: "",
                                labelText: "Address",
                                  hintStyle: const TextStyle(color: Colors.black),
                                errorStyle: redheadingStyle
                              ),
                              autocorrect: true,
                              /*     validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vehicle Photo Cannot be null";
                              } else {
                                return null;
                              }*/
                              // },
                              onChanged: (text) {
                                setState(() {});
                                // do something with text
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                      height: 2,
                        ),
                        Card(
                          color: ColorUtils.fillColor,
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: ColorUtils.fillColor,
                                fillColor: ColorUtils.fillColor,
                                enabled: false,
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                    color: ColorUtils.app_primary_color),
                                hintText: "",
                                labelText: "Phone Number",
                                  hintStyle: const TextStyle(color: Colors.black),
                                errorStyle: redheadingStyle
                              ),
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Confirm Password";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {});
                                // do something with text
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Card(
                          color: ColorUtils.fillColor,
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: ColorUtils.fillColor,
                                fillColor: ColorUtils.fillColor,
                                enabled: false,
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                    color: ColorUtils.app_primary_color),
                                hintText: "",
                                labelText: "Email ID",
                                  hintStyle: const TextStyle(color: Colors.black),
                                errorStyle: redheadingStyle
                              ),
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Email ID";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (text) {
                                setState(() {});
                                // do something with text
                              },
                            ),
                          ),
                        ),


                        const SizedBox(
                      height:10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButton("Register".toUpperCase(),
                              onClick: () {
                                if (formKey.currentState!.validate()){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SignIn()),
                                  );
                                }
                          }, isFullWidth: true),
                        ),
                        const SizedBox(
                      height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextNormal("Already Have An Account ?"),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignIn()),
                                  );
                                },
                                child: CustomTextBlue(" Login Now")),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
