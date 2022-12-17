import 'package:flutter/material.dart';

class CustomTextNormal24 extends StatelessWidget {
  final String text;
  const CustomTextNormal24(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textScaleFactor: 1,
        style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.normal));
  }
}