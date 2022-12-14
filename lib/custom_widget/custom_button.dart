import 'package:flutter/material.dart';
import '../utils/color_utils.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final bool? isFullWidth;


  final Function() onClick;

  const CustomButton(this.text,
      {Key? key, this.isFullWidth, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15))   ,  gradient: LinearGradient(
        colors: [
         ColorUtils.green1,
         ColorUtils.green2,

        ],
      )

      ),
      child: FlatButton(

          onPressed: onClick,
          child: Text(
            text,
            textScaleFactor: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }
}
