import 'package:ev_feul/user/screens/subscriptions.dart';
import 'package:ev_feul/user/screens/registernow_in.dart';
import 'package:ev_feul/user/screens/sign_in.dart';
import 'package:ev_feul/utils/color_utils.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
      home: MyHomePage(
        title: "",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/spalsh_bg.png",
                fit: BoxFit.fill,
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width * .42,
                    height: MediaQuery.of(context).size.height * .42,
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),
                Text(
                  "USER LOGIN",
                  textScaleFactor: 1,
                  style: headingStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .60,
                    height: MediaQuery.of(context).size.height * .06,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                          colors: [
                            ColorUtils.green1ln,
                            ColorUtils.green2ln,
                          ],
                        )),
                    child: const Center(
                      child: Text(
                        "Log in Now",
                        textScaleFactor: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "OR",
                  textScaleFactor: 1,
                  style: headingStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .60,
                  height: MediaQuery.of(context).size.height * .06,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                        colors: [
                          ColorUtils.Create1ln,
                          ColorUtils.Create2ln,
                        ],
                      )),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterNow()),
                        );
                      },
                      child: const Text(
                        "Create A Account",
                        textScaleFactor: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
