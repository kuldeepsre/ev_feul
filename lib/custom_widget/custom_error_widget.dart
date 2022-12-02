import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
          child: Text(
            'Failed to render Widget',
            style: TextStyle(
                fontSize: 10, color: Colors.black, decoration: TextDecoration.none),
          )),
    );
  }
}