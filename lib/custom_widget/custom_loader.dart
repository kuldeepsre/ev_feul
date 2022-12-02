import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(strokeWidth: 3,color: ColorUtils.btnBlue,
          ),
        ));
  }
}