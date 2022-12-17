import 'package:flutter/material.dart';

class CustomTextWhiteNormal extends StatelessWidget {
  final String text;
  const CustomTextWhiteNormal(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textScaleFactor: 1,
        style: const TextStyle(
            fontSize: 14,

            color: Colors.white,
            fontWeight: FontWeight.normal));
  }
}