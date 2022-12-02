import 'package:intl/intl.dart';

class DateTimeUtils {
  static convertUtcToLocalDate(String date) {
    var dateValue =
        new DateFormat("yyyy-MM-ddTHH:mm:ss").parseUTC(date).toLocal();
    String formattedDate = DateFormat("dd MMM yyyy").format(dateValue);
    return formattedDate;
  }

  static checkDateFormate(String date) {
    if (date.isNotEmpty) {
      String spDate = date.split(".")[0];
      var dateValue =
          new DateFormat("yyyy-MM-dd HH:mm:ss").parseUTC(spDate).toLocal();
      String formattedDate = DateFormat("dd MMM yyyy HH:mm").format(dateValue);
      return formattedDate;
    } else {
      return "na";
    }
  }
}
//022-05-24T15:13:28.833
