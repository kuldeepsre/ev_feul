import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? text;
  final bool? isEnabled;
  final Function(String value)? onChanged;

  const CustomTextField(
      {Key? key, this.text, this.isEnabled, this.onChanged})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return widget.isEnabled == null || widget.isEnabled!
        ? TextField(
            maxLines: 1,
            controller: TextEditingController(text: widget.text),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none),
            onChanged: widget.onChanged)
        : Text(
            widget.text!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          );
  }
}
