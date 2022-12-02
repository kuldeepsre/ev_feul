import 'package:flutter/material.dart';

import '../utils/strings.dart';
import '../utils/text_style.dart';

class CustomTextBlue extends StatelessWidget {
  const CustomTextBlue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
       //  NavigationService().pushNamed(addfamilyvehicle);
        },
        child: Text(
          Strings.addFamilyVehicle,
          textScaleFactor: 1,
          style: bluetextColorStyle,
        ),
      );
}
