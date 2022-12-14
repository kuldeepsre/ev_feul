import 'package:flutter/material.dart';

import '../utils/strings.dart';
import '../utils/text_style.dart';

class CustomTextBlue extends StatelessWidget {

  final String text;

  const CustomTextBlue(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    textScaleFactor: 1,
    style: bluetextColorStyle,
  );
}
