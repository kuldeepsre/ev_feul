
import 'package:ev_feul/model/list_result.dart';
import 'package:ev_feul/utils/constants.dart';
import 'package:ev_feul/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class ParkingUiTable extends StatelessWidget {
  List<ParkingListResult> plist;

  ParkingUiTable({Key? key, required this.plist, required int index, required ParkingListResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController? _scrollController =
        ScrollController(initialScrollOffset: 0);
/*    ScrollController? _scrollController =
        ScrollController(initialScrollOffset: 0);*/

    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      thickness: 5,
      hoverThickness: 08,
      showTrackOnHover: true,
      child: SingleChildScrollView(
     controller: _scrollController,


      scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => ColorUtils.grayColor),
            headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            columnSpacing: 0,
            dataRowHeight: 70,
            dividerThickness: 1,
            showBottomBorder: true,
            decoration: BoxDecoration(
              border: Border(
                  right: Divider.createBorderSide(context, width: 5.0),
                  left: Divider.createBorderSide(context, width: 5.0)),
            ),
            columns: [
              DataColumn(
                label: Container(
                  padding: const EdgeInsets.all(2.0),
                  width: MediaQuery.of(context).size.width * .14,
                  child: Text(
                    "Vehicle Number",
                    maxLines: 2,
                    softWrap: true,
                    textScaleFactor: 1,
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: ColorUtils.app_primary_color,
                        fontSize: 14.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                    //style: Theme.of(context).textTheme.display4,
                  ),
                ),
              ),
              DataColumn(label: Constants.verticalDivider),
              DataColumn(
                label: Container(
                  padding: const EdgeInsets.all(2.0),
                  width: MediaQuery.of(context).size.width * .14,
                  child: Text(
                    "Driver Name",
                    maxLines: 2,
                    softWrap: true,
                    textScaleFactor: 1,
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: ColorUtils.app_primary_color,
                        fontSize: 14.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                    //style: Theme.of(context).textTheme.display4,
                  ),
                ),
              ),
              DataColumn(label: Constants.verticalDivider),
              DataColumn(
                label: Container(
                  padding: const EdgeInsets.all(2.0),
                  width: MediaQuery.of(context).size.width * .14,
                  child: Text(
                    "Driver_mob_number",
                    maxLines: 2,
                    softWrap: true,
                    textScaleFactor: 1,
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: ColorUtils.app_primary_color,
                        fontSize: 14.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                    //style: Theme.of(context).textTheme.display4,
                  ),
                ),
              ),
              DataColumn(label: Constants.verticalDivider),


            ],
            rows: plist
                .map(
                  ((element) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              width: MediaQuery.of(context).size.width * .12,
                              child: Text(
                                "${element.vehicleNumber == null ? "" : element.vehicleNumber }",
                                /*   /*   maxLines: 1,*/*/
                                textAlign: TextAlign.start,
                                style:listItemSubTitleStyle,
                                //style: Theme.of(context).textTheme.display4,
                              ),
                            ),
                          ),
                          DataCell(Constants.verticalDivider),

                          DataCell(
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              width: MediaQuery.of(context).size.width * .12,
                              child: Text(
                                "${element.driverName == null ? "" : element.driverName }",
                                /*   /*   maxLines: 1,*/*/
                                textAlign: TextAlign.start,
                                style:listItemSubTitleStyle,
                                //style: Theme.of(context).textTheme.display4,
                              ),
                            ),
                          ),
                          DataCell(Constants.verticalDivider),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              width: MediaQuery.of(context).size.width * .12,
                              child: Text(
                                "${element.driverName == null ? "" : element.driverName }",
                                /*   /*   maxLines: 1,*/*/
                                textAlign: TextAlign.start,
                                style:listItemSubTitleStyle,
                                //style: Theme.of(context).textTheme.display4,
                              ),
                            ),
                          ),
                          DataCell(Constants.verticalDivider),

                          DataCell(
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              width: MediaQuery.of(context).size.width * .12,
                              child: Text(
                                "${element.driverMobNumber == null ? "" : element.driverMobNumber }",
                                /*   /*   maxLines: 1,*/*/
                                textAlign: TextAlign.start,
                                style:listItemSubTitleStyle,
                                //style: Theme.of(context).textTheme.display4,
                              ),
                            ),
                          ),
                          DataCell(Constants.verticalDivider),




                        ],
                      )),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
