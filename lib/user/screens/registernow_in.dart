// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/custom_widget/custom_button.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/custom_widget/custom_text_blue.dart';
import 'package:ev_feul/custom_widget/custom_text_normal.dart';
import 'package:ev_feul/custom_widget/custom_text_white_normal.dart';
import 'package:ev_feul/tabs/home_scrrem.dart';
import 'package:ev_feul/tabs/tabspage.dart';
import 'package:ev_feul/user/screens/sign_in.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/custom_dialog.dart';
import 'package:ev_feul/utils/strings.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class RegisterNow extends StatefulWidget {
  const RegisterNow({Key? key}) : super(key: key);

  @override
  _GateScreenState createState() => _GateScreenState();
}

class _GateScreenState extends State<RegisterNow> {
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
  var selectProject = "";
  final statusDateControoler = TextEditingController();

  var emailController = TextEditingController(text: "");
  var passController = TextEditingController(text: "");
  var conpassController = TextEditingController(text: "");

  var idController = TextEditingController(text: "");
  var evImageController = TextEditingController(text: "");
  var addressController = TextEditingController(text: "");
  var phoneController = TextEditingController(text: "");
  var ownerController = TextEditingController(text: "");
  var evController = TextEditingController(text: "");
  var vehcleImageController = TextEditingController(text: "");
  File ? _image, _image2, _image3;

  bool _isLoading = false;





  @override
  void initState() {
    super.initState();
    _validate = false;
    _isLoading = false;

/*    Constants.loginResponseModel.result.listProjects;
    projectList = Constants.loginResponseModel.result.listProjects;*/
  }

  @override
  Widget build(BuildContext context) {
    final gateBloc = BlocProvider.of<GateBloc>(context);
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(

          backgroundColor: Colors.white,
          body: BlocListener<GateBloc, GateState>(
            listener: (context, state) {

            },
            child: BlocBuilder(
              bloc: gateBloc,
              builder: (BuildContext context, GateState state) {
                if (state is GateLoading) {
                  return const Center(child: CustomLoader());

                }
                if(state is DataSaved){
                  CustomDialogs().showErrorDialog(
                      msg: Strings.successMessage,
                      title: Strings.dataSaved,
                      onClick: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => SignIn()),
                                (route) => false
                        );

                      });
                }
                if(state is DataFailed){
                  CustomDialogs().showErrorDialog(
                      msg: Strings.successMessage,
                      title: Strings.dataSaved,
                      onClick: () {


                      });
                }
                return  Stack(

                  children: [

                    Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .30,
                              child: Image.asset(
                                "assets/images/login.png", fit: BoxFit.fill,),
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
                                  const SizedBox(height: 20,),  TextFormField(
                                    controller: evController,
                                    keyboardType: TextInputType.number,
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
                                      labelText: "EV Number",
                                      hintStyle: const TextStyle(color: Colors.white),
                                    ),

                                    autocorrect: true,
                                    style:
                                    listTextStyle,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please EV Number";
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
                                  const SizedBox(height: 10,),TextFormField(
                                    controller: conpassController,
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
                                      labelText: "Confirm Password",

                                      hintStyle: const TextStyle(color: Colors.white),
                                    ),
                                    autocorrect: true,
                                    style:
                                    listTextStyle,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter confirm password";
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
                                    readOnly: true,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: ColorUtils.textFill,
                                      suffix: GestureDetector(
                                          onTap: (){
                                            _imgFromGallery();


                                          },
                                          child: Card(child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Browse",textScaleFactor: 1,),
                                          ))),

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
                                    controller: evImageController,
                                    readOnly: true,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: ColorUtils.textFill,
                                      suffix: GestureDetector(
                                          onTap: (){
                                            _imgFromGallery2();


                                          },
                                          child: Card(child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Browse",textScaleFactor: 1,),
                                          ))),

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
                                      labelText: "EV RC Copy",
                                      hintStyle: const TextStyle(color: Colors.white),
                                    ),
                                    autocorrect: true,
                                    style:
                                    listTextStyle,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please select  EV RC Copy";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (text) {
                                      setState(() {});
                                      // do something with text
                                    },
                                  ),

                                  const SizedBox(height: 10,),  TextFormField(
                                    controller: vehcleImageController,
                                    readOnly: true,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: ColorUtils.textFill,
                                      suffix: GestureDetector(
                                          onTap: (){
                                            _imgFromGallery3();


                                          },
                                          child: Card(child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Browse",textScaleFactor: 1,),
                                          ))),

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
                                      labelText: "Vehicle Photo",
                                      hintStyle: const TextStyle(color: Colors.white),
                                    ),
                                    autocorrect: true,
                                    style:
                                    listTextStyle,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please select  Vehicle Photo";
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
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      new LengthLimitingTextInputFormatter(10),
                                    ],
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
                                      child: const CustomTextWhiteNormal(
                                          Strings.forgotPass)),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    child: CustomButton("Register", onClick: () {

                                            if (formKey.currentState!.validate()){
                                              save(context);
                                              }

                                    }, isFullWidth: true),
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(Strings.account, textScaleFactor: 1,
                                        style: listTextStyle,),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext context) =>
                                                        SignIn()),
                                                    (Route<dynamic> route) =>
                                                route.isFirst);
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
                );
              },
            ),
          ))

    );
  }

  _imgFromGallery() async {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(

            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,

        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          bool _fiberSwitch = true;
          bool _ptrollerSwitch = true;
          bool _AlertSwitch = false;
          return StatefulBuilder(builder:
              (BuildContext context, StateSetter mystate) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),

              child: Container(
                //   color: _darkTheme?ColorConstant.black900:ColorConstant.whiteA700,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Choose Picture",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      trailing: GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).pop(
                                context);
                          },
                          child: Icon(
                            Icons.close,
                            size: 24,

                          )),
                    ),
                    Divider(thickness: 1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8),
                      child: GestureDetector(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['png', 'jpg'],
                              allowCompression: true,
                            );

                            if (result != null) {
                              File file = File(
                                  result.files.single.path.toString());

                              final bytes = file
                                  .readAsBytesSync()
                                  .lengthInBytes;
                              final kb = bytes / 1024;
                              final mb = kb / 1024;
                              if (mb <= 5) {
                                setState(() {
                                  _image = file;
                                  idController.text=file.toString().split("/").last;

                                  Navigator.pop(context);
                                });
                              } else {
                                Navigator.pop(context);
                                print("HI");
                              }
                            }
                          },
                          child: Text("Pick From Gallery")),
                    ),

                    Divider(thickness: 1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8),
                      child: GestureDetector(
                          onTap: () async {
                            PickedFile? pickedFile = await ImagePicker()
                                .getImage(
                              source: ImageSource.camera,
                              maxWidth: 1800,
                              maxHeight: 1800,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                _image = File(pickedFile.path);
                                idController.text=_image!.path.toString().split('/').last;
                              });
                            }
                          },

                          child: Text("Pick From Camera")),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  _imgFromGallery2() async {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(

            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,

        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          bool _fiberSwitch = true;
          bool _ptrollerSwitch = true;
          bool _AlertSwitch = false;
          return StatefulBuilder(builder:
              (BuildContext context, StateSetter mystate) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),

              child: Container(
                //   color: _darkTheme?ColorConstant.black900:ColorConstant.whiteA700,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Choose Picture",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      trailing: GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).pop(
                                context);
                          },
                          child: Icon(
                            Icons.close,
                            size: 24,

                          )),
                    ),
                    Divider(thickness: 1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8),
                      child: GestureDetector(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['png', 'jpg'],
                              allowCompression: true,
                            );
                            if (result != null) {
                              File file = File(
                                  result.files.single.path.toString());

                              final bytes = file
                                  .readAsBytesSync()
                                  .lengthInBytes;
                              final kb = bytes / 1024;
                              final mb = kb / 1024;
                              if (mb <= 5) {
                                setState(() {
                                  _image2 = file;
                                  evImageController.text=file.toString().split('/').last;

                                  Navigator.pop(context);
                                });
                              } else {
                                Navigator.pop(context);
                                print("HI");
                              }
                            }
                          },
                          child: Text("Pick From Gallery")),
                    ),

                    Divider(thickness: 1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8),
                      child: GestureDetector(
                          onTap: () async {
                            PickedFile? pickedFile = await ImagePicker()
                                .getImage(
                              source: ImageSource.camera,
                              maxWidth: 1800,
                              maxHeight: 1800,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                _image2 = File(pickedFile.path);
                                evImageController.text=_image2.toString().split('/').last;

                              });
                            }
                          },

                          child: Text("Pick From Camera")),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  _imgFromGallery3() async {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(

            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,

        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          bool _fiberSwitch = true;
          bool _ptrollerSwitch = true;
          bool _AlertSwitch = false;
          return StatefulBuilder(builder:
              (BuildContext context, StateSetter mystate) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),

              child: Container(
                //   color: _darkTheme?ColorConstant.black900:ColorConstant.whiteA700,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Choose Picture",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      trailing: GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).pop(
                                context);
                          },
                          child: Icon(
                            Icons.close,
                            size: 24,

                          )),
                    ),
                    Divider(thickness: 1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8),
                      child: GestureDetector(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['png', 'jpg'],
                              allowCompression: true,
                            );
                            if (result != null) {
                              File file = File(
                                  result.files.single.path.toString());

                              final bytes = file
                                  .readAsBytesSync()
                                  .lengthInBytes;
                              final kb = bytes / 1024;
                              final mb = kb / 1024;
                              if (mb <= 5) {
                                setState(() {
                                  _image3 = file;

                                  vehcleImageController.text=file.toString().split('/').last;
                                  Navigator.pop(context);
                                });
                              } else {
                                Navigator.pop(context);
                                print("HI");
                              }
                            }
                          },
                          child: Text("Pick From Gallery")),
                    ),

                    Divider(thickness: 1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8),
                      child: GestureDetector(
                          onTap: () async {
                            PickedFile? pickedFile = await ImagePicker()
                                .getImage(
                              source: ImageSource.camera,
                              maxWidth: 1800,
                              maxHeight: 1800,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                _image3 = File(pickedFile.path);
                                vehcleImageController.text=_image3.toString().split('/').last;

                              });
                            }
                          },

                          child: Text("Pick From Camera")),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void save(BuildContext context) {


    if (_image == null) {
      CustomDialogs.showDialogForError(context,
          "Please upload Aadhaar image ", "Validations required");
    } else if (_image2 == null) {
      CustomDialogs.showDialogForError(
          context,
          "Please upload deriving licences  image ",
          "Validations required");
    }
    else if (_image3 == null) {
      CustomDialogs.showDialogForError(context,
          "Please upload photo image ", "Validations required");
    }
    else {
      final gateBloc = BlocProvider.of<GateBloc>(context);

      gateBloc.add(AddInfo(
          ev_number:evController.text.toString(),
          password:passController.text.toString(),
          confirm_password:conpassController.text.toString(),
          owner_name:ownerController.text.toString(),
          address:addressController.text.toString(),
          phone:phoneController.text.toString(),
          email:emailController.text.toString(),
          ev_rc_copy: _image == null ? "" : _image!.path,
          vehicle_photo: _image2 == null ? "" : _image2!.path,
          id_proof: _image3 == null ? "" : _image3!.path,
      ));
    }
  }

}