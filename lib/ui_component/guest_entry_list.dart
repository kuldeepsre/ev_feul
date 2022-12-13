// ignore_for_file: prefer_const_constructors

import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GuestListDetailsUI extends StatelessWidget {
  final List<dynamic> data;
  final int index;

  const GuestListDetailsUI({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(08)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    GlobleConstant.GFamilyName,
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${data[index]['Family Name'] ?? "NA"}",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    GlobleConstant.GName,
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${data[index]['Guest Name'] ?? "NA"}",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    GlobleConstant.DriverName,
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${data[index]['Driver Name'] ?? "NA"}",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    GlobleConstant.VehicleNumber,
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${data[index]['Vehicle Number'] ?? "NA"}",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    GlobleConstant.Gmobilenumber,
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${data[index]['Driver Mob Number'] ?? "NA"}",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1,
                    style: listTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
