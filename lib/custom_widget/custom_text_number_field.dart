import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextNumberField extends StatefulWidget {
  final String? text;
  final bool? isEnabled;
  final Function(String value)? onChanged;

  const CustomTextNumberField(
      {Key? key, this.text, this.isEnabled, this.onChanged})
      : super(key: key);

  @override
  State<CustomTextNumberField> createState() => _CustomTextNumberFieldState();
}

class _CustomTextNumberFieldState extends State<CustomTextNumberField> {
  @override
  Widget build(BuildContext context) {
    return widget.isEnabled == null || widget.isEnabled!
        ? TextFormField(
            maxLines: 1,
            controller: TextEditingController(text: widget.text),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
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
