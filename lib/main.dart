import 'dart:async';
import 'package:ev_feul/tabs/tabspage.dart';
import 'package:ev_feul/user/screens/first_screen.dart';
import 'package:ev_feul/user/screens/home.dart';
import 'package:ev_feul/user/screens/login_screen.dart';
import 'package:ev_feul/user/screens/plan_list.dart';
import 'package:ev_feul/user/screens/profile.dart';
import 'package:ev_feul/user/screens/register_screen.dart';
import 'package:ev_feul/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'custom_widget/custom_error_widget.dart';
import 'utils/navigation_service.dart';
import 'utils/route_constants.dart';
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

class MyAppWidget extends StatefulWidget {
  @override
  MyApp createState() => new MyApp();
}

class MyApp extends State<MyAppWidget> {
  late bool _jailbroken = false;
  late bool _developerMode = false;

  @override
  void initState() {
    // TODO: implement initState
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
        child:  MaterialApp(
          title: Strings.projectname,
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          navigatorKey: NavigationService().navigationKey,
          initialRoute: '/',
          onGenerateRoute: _onGenerateRoutes,
        ));
  }

  Route<dynamic> _onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => SplashScreenView(
              navigateRoute:  TabsPage(selectedIndex: 0,),
              duration: 2000,
              imageSize: 130,
              imageSrc: "assets/images/logo.png",
              text: "EV FEUL",
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
            ));
        break;
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const Home());
        break; case loginScreenRoute:
        return MaterialPageRoute(builder: (_) => const LoginNow());
        break;
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreenMain());
        break;
    }
  }


}
