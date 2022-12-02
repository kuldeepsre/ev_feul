import 'package:flutter/material.dart';

class CustomTextNormal extends StatelessWidget {
  final String text;
  const CustomTextNormal(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.normal));
  }
}