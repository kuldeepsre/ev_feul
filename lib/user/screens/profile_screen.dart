import 'dart:io';
import 'package:ev_feul/bloc/gate_bloc/gate_bloc.dart';
import 'package:ev_feul/custom_widget/custom_loader.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/custom_dialog.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../custom_widget/custom_button.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _GateScreenState createState() => _GateScreenState();
}

class _GateScreenState extends State<Profile> {
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
  File? _image, _image2, _image3;

  bool _isLoading = false;
  var selectCountry, selectWeek, maintance_dropdown, area;

  String _fileName = "";

  final TextEditingController detailController = TextEditingController();
  String? selectedImage;

  // List<AlertFileModel> imageThumbNailList = [];
  ImagePicker _picker = ImagePicker();
  late String detail;
  File? _Cameraimage;

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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocListener<GateBloc, GateState>(
              listener: (context, state) {
                if (state is DataSaved) {

                }
                if (state is DataFailed) {
                  CustomDialogs.showDialogForError(
                      context, state.message, state.title);
                }
              },
              child: BlocBuilder(
                bloc: gateBloc,
                builder: (BuildContext context, GateState state) {
                  if (state is GateLoading) {
                    return const Center(child: CustomLoader());
                  }

                  return Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/images/bg.png",
                            fit: BoxFit.fill,
                          )),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  child:_image == null
                                      ? Image.network(
                                          GlobleConstant.profilePhoto.toString(),
                                          fit: BoxFit.fill,
                                        )
                                      : CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 50,
                                          child: ClipOval(
                                            child: Image.file(
                                              File(_image!.path),
                                              fit: BoxFit.fill,
                                              width: 95,
                                              height: 95,
                                            ),
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _imgFromGallery();
                                  },
                                  child: Container(
                                    height: 25.0,
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Edit Pic",
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: ownerController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorUtils.textFill,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: ColorUtils.btnBlue)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorUtils.btnBlue,
                                            width: 0.5) //This is Ignored,

                                        ),
                                    labelStyle: TextStyle(color: ColorUtils.bgText),
                                    hintText: GlobleConstant.ownerName,
                                    labelText: "Owner Name",
                                    hintStyle: const TextStyle(color: Colors.black),
                                  ),
                                  autocorrect: true,
                                  style: listTextStyle,
                                  validator: (value) {
                                 /*   if (value == null || value.isEmpty) {
                                      return "Please Enter Owner Name";
                                    } else {
                                      return null;
                                    }*/
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorUtils.textFill,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: ColorUtils.btnBlue)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorUtils.btnBlue,
                                            width: 0.5) //This is Ignored,

                                        ),
                                    labelStyle: TextStyle(color: ColorUtils.bgText),
                                    hintText: GlobleConstant.phone,
                                    labelText: "Phone Number",
                                    hintStyle: const TextStyle(color: Colors.black),
                                  ),
                                  autocorrect: true,
                                  style: listTextStyle,
                                  validator: (value) {
                                   /* if (value == null || value.isEmpty) {
                                      return "Phone Number";
                                    } else {
                                      return null;
                                    }*/
                                  },
                                  onChanged: (text) {
                                    setState(() {});
                                    // do something with text
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorUtils.textFill,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: ColorUtils.btnBlue)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorUtils.btnBlue,
                                            width: 0.5) //This is Ignored,

                                        ),
                                    labelStyle: TextStyle(color: ColorUtils.bgText),
                                    hintText: GlobleConstant.email,
                                    labelText: "Email ID",
                                    hintStyle: const TextStyle(color: Colors.black),
                                  ),
                                  autocorrect: true,
                                  style: listTextStyle,
                                  validator: (value) {
                                    /*  if (value == null || value.isEmpty) {
                                      return "Email ID";
                                    } else {
                                      return null;
                                    }*/
                                  },
                                  onChanged: (text) {
                                    setState(() {});
                                    // do something with text
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: addressController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorUtils.textFill,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: ColorUtils.btnBlue)),
                                        border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorUtils.btnBlue,
                                            width: 0.5) //This is Ignored,

                                    ),
                                    labelStyle: TextStyle(color: ColorUtils.bgText),
                                    hintText: GlobleConstant.address,
                                    labelText: "Address",
                                    hintStyle: const TextStyle(color: Colors.black),
                                  ),
                                  autocorrect: true,
                                  style: listTextStyle,
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
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: CustomButton("Update Profile", onClick: () {
                                    print("HGG");

                                    if (_image == null) {
                                      CustomDialogs.showDialogForError(
                                          context, "Please upload Profile pic ", "Validations required");

                                    } else         {
                                      gateBloc.add(UploadeProfile(

                                      owner_name:ownerController.text.toString().isEmpty?GlobleConstant.ownerName:ownerController.text.toString(),
                                      address:addressController.text.toString().isEmpty?GlobleConstant.address:addressController.text.toString(),
                                      phone: phoneController.text.toString().isEmpty?GlobleConstant.phone:phoneController.text.toString(),
                                      email: emailController.text.toString().isEmpty?GlobleConstant.email:ownerController.text.toString(),
                                      id_proof: _image == null ?_fileName.toString() : _image!.path,

                                    ));}

                                  }, isFullWidth: true),

                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )));
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
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
              child: Container(
                //   color: _darkTheme?ColorConstant.black900:ColorConstant.whiteA700,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .30,
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
                            Navigator.of(context, rootNavigator: true)
                                .pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            size: 24,
                          )),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8),
                      child: GestureDetector(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['png', 'jpg'],
                              allowCompression: true,
                            );

                            if (result != null) {
                              File file =
                                  File(result.files.single.path.toString());

                              final bytes =
                                  file.readAsBytesSync().lengthInBytes;
                              final kb = bytes / 1024;
                              final mb = kb / 1024;
                              if (mb <= 5) {
                                setState(() {
                                  _image = file;
                                  idController.text =
                                      file.toString().split("/").last;

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
                    Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8),
                      child: GestureDetector(
                          onTap: () async {
                            PickedFile? pickedFile =
                                await ImagePicker().getImage(
                              source: ImageSource.camera,
                              maxWidth: 1800,
                              maxHeight: 1800,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                _image = File(pickedFile.path);
                                idController.text =
                                    _image!.path.toString().split('/').last;
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
/*    if (_image == null) {
      CustomDialogs.showDialogForError(
          context, "Please upload Profile pic ", "Validations required");

    } else {*/
      final gateBloc = BlocProvider.of<GateBloc>(context);
      String ? ownerName=ownerController.text.toString().isEmpty?GlobleConstant.ownerName;
      String ? address=addressController.text.toString().isEmpty?GlobleConstant.address;
      String ? phone=phoneController.text.toString().isEmpty?GlobleConstant.phone;

      String ? memailid=emailController.text.toString().isEmpty?GlobleConstant.email;


      gateBloc.add(UploadeProfile(

        owner_name:ownerName.toString(),
        address: address.toString(),
        phone:phone.toString(),
        email: memailid.toString(),
        id_proof: _image == null ?_fileName.toString() : _image!.path,

      ));
    }
  }
