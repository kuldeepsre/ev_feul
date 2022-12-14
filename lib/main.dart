
import 'package:ev_feul/user/screens/first_screen.dart';

import 'package:ev_feul/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'custom_widget/custom_error_widget.dart';

import 'utils/color_utils.dart';

import 'package:splash_screen_view/SplashScreenView.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],);
  ErrorWidget.builder = (errorDetails) => const CustomErrorWidget();
  runApp(Phoenix(child: MyAppWidget()));
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData windowData =
    MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    windowData = windowData.copyWith(
      textScaleFactor: 1,
    );
    return MediaQuery(
        data: windowData,
        child: MaterialApp(
          title: Strings.projectname,
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: SplashScreenView(
            navigateRoute: const LoginScreenMain(),
            duration: 2000,
            imageSize: 130,
            imageSrc: "assets/images/logo.png",
            text: "EV FUEL",
            textType: TextType.ColorizeAnimationText,
            textStyle: const TextStyle(fontSize: 24.0),
            colors: [
              Colors.white,
              ColorUtils.menu_selected_color,
              ColorUtils.menu_item_bg_color,
              Colors.yellow,
              Colors.red,
            ],
            backgroundColor: ColorUtils.app_primary_color,
          ),

        ));
  }
}


