// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:ev_feul/custom_widget/custom_button.dart';
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
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';


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

  var idController = TextEditingController(text: "");
  var addressController = TextEditingController(text: "");
  var phoneController = TextEditingController(text: "");
  var ownerController = TextEditingController(text: "");
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
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(

          backgroundColor: Colors.white,
          body: Stack(

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
                            GestureDetector(

                                child:
                                Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      _imgFromGallery();
                                    },
                                    child: Expanded(
                                        flex: 1,
                                        child: Card(child: Text("Browse"))),
                                  ),
                                  SizedBox(width: 20,),
                                  if (_image != null)
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(

                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.50,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * .09,
                                          child: Image.file(_image!
                                            , fit: BoxFit.fill,)
                                      ),
                                    )
                                  else
                                    Expanded(
                                        flex: 1,
                                        child: Text("")),
                                ],)


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
                                child: const CustomTextWhiteNormal(
                                    Strings.forgotPass)),
                            const SizedBox(height: 10,),
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: CustomButton("Register", onClick: () {
                                save(context);
                                /*  */ /*   if (formKey.currentState!.validate()){

                              }*/ /*
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  MyStatefulWidget()),
                                );
*/
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
          )),
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
    var t1 = _image;
    print(t1);

    if (_image == null) {
      CustomDialogs.showDialogForError(context,
          "Please upload Aadhaar image ", "Validations required");
    } else if (_image2 == null) {
      CustomDialogs.showDialogForError(
          context,
          "Please upload deriving licences  image ",
          "Validations required");
    } else if (_image3 == null) {
      CustomDialogs.showDialogForError(context,
          "Please upload photo image ", "Validations required");
    } else {
      /*    addinfoBloc.add(AddInfo(
        username: PatrolllerNameController.text.toString(),
        phone: MobileNoController.text.toString(),
        caddress: Address1Controller.text.toString(),
        ccity: cityController.text.toString(),
        cstate: selectState.toString(),
        ccountry: selectCountry.toString(),
        cpin: pincodeController.text.toString(),
        paddress: permanentAddressController.text.toString(),
        pstate: selectState.toString(),
        pcountry: selectCountry.toString(),
        ppin: PPinCodeController.text.toString(),
        pcity: PCityController.text.toString(),
        aadharnumber: AddaharcardNoController.text.toString(),
        dlnumber: DerivingLincenceControlller.text.toString(),
        maintenancepoint:
        DerivingLincenceControlller.text.toString(),
        phonedetails: "phonedetails",
        area: areadropdown == null ? "" : areadropdown,
        aadhar: _image == null ? "" : _image.path,
        drivinglicencse: _image2 == null ? "" : _image2.path,
        photo: _image3 == null ? "" : _image3.path,
      ));*/
    }
  }

}