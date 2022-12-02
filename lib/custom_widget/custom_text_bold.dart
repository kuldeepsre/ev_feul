import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextBold extends StatelessWidget {
  final String text;

  const CustomTextBold(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textScaleFactor: 1,
        style: buttonBlackTextStyle);
  }
}
