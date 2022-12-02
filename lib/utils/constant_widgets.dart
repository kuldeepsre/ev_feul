import 'package:ev_feul/utils/route_constants.dart';
import 'package:ev_feul/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'navigation_service.dart';
import 'text_style.dart';

import 'custom_dialog.dart';
import 'package:hexcolor/hexcolor.dart';


class ConstantWidgets {
  static const Widget verticalDivider = VerticalDivider(
    thickness: 0.5,
    width: 0.5,
    color: Colors.black,
  );
  static PreferredSizeWidget appBar(context, title) => AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor("#4ECDC4"),
              HexColor("#556270"),
            ],
          )
      ),
    ),
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width*.12,
                    height: MediaQuery.of(context).size.height*.12,
                    child: Image.asset("assets/images/ril_logo.png",)),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.projectname,
                        maxLines: 1,
                        textScaleFactor: 1,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        title,
                        textScaleFactor: 1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 11.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ],
        ),
      ],
    ),
    actions: [
      InkWell(
        onTap: () async {
          SystemChannels.textInput.invokeMethod('TextInput.hide');

          CustomDialogs.showLogoutConfirmation(context);
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.power_settings_new,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      InkWell(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          NavigationService().pushNamed(selectionRoute);
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.home),
        ),
      ),
    ],
  );
}
