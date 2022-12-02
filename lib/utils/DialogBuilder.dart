import 'package:flutter/material.dart';

import 'LoadingIndicator.dart';
import 'color_utils.dart';

class DialogBuilder {
  DialogBuilder(this.context);
  final BuildContext context;
  void showLoadingIndicator(String text) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: ColorUtils.app_primary_color,
              content: LoadingIndicator(text: text),
            ));
      },
    );
  }
}
