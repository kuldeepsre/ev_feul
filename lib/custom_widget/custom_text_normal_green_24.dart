import 'package:flutter/material.dart';

class CustomTextNormalGreen24 extends StatelessWidget {
  final String text;
  const CustomTextNormalGreen24(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textScaleFactor: 1,
        style: const TextStyle(
            fontSize: 18,
            color: Colors.greenAccent,
            fontWeight: FontWeight.normal));
  }
}