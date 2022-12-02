
import 'dart:async';
import 'package:ev_feul/tabs/tabspage.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Phoenix(child: MyAppWidget()));
}

class MyAppWidget extends StatefulWidget {
  @override
  MyApp createState() => new MyApp();
}
class MyApp extends State<MyAppWidget> {
  late bool _jailbroken = false;
  late bool _developerMode = false;
  @override
  void initState() {
    super.initState();

  }
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
          title: 'CHO Dashboards',
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: SplashScreenView(
            navigateRoute: TabsPage(selectedIndex: 0,),
            //LoginScreen(),
            duration: 5000,
            imageSize: 130,
            imageSrc: "assets/images/logo.png",
            text: "EV FEUL",
            textType: TextType.ColorizeAnimationText,
            textStyle: TextStyle(
              fontSize: 24.0,
            ),
            colors: [
              Colors.white,
              ColorUtils.menu_selected_color,
              ColorUtils.menu_item_bg_color,
              Colors.yellow,
              Colors.black,
            ],
            backgroundColor: ColorUtils.app_primary_color,
          ),
        ));
  }


}
