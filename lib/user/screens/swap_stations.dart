import '../../bloc/login/login_bloc.dart';
import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_loader.dart';
import '../../custom_widget/custom_text_bold.dart';
import '../../custom_widget/custom_text_normal.dart';
import '../../utils/color_utils.dart';
import '../../utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SwapStation extends StatefulWidget {
  const SwapStation({Key? key}) : super(key: key);
  @override
  _SwapStationState createState() => _SwapStationState();
}
 class _SwapStationState extends State<SwapStation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(LoginInitial()),
      child: const SwapStation(),
    );
  }
}

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<SwapStation> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late bool _validate;
  late bool isLogin;
  var selectProject = "";

  var emailController=TextEditingController(text: "Userid/Email");
  var passController=TextEditingController(text: "Userid/Email");

  @override
  void initState() {
    super.initState();
    _validate = false;
    isLogin = false;
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: ColorUtils.app_primary_color,

        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {

          },
          child: BlocBuilder(
            bloc: loginBloc,
            builder: (BuildContext context, LoginState state) {
              if (state is LoginLoding) {
                return const CustomLoader();
              }

              return Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    height: 150,
                    width: 150,
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        print('FAB tapped!');
                      },
                      backgroundColor: Colors.blueGrey,
                    ),
                    right: 0,
                    left: 0,
                    bottom: -26,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
