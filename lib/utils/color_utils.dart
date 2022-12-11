import 'dart:math';
import 'dart:ui';

class ColorUtils {
  static Color menu_selected_color = "#BF9D5E".toColor();
  static Color app_primary_color = "#2E4053".toColor();
  static Color menu_item_bg_color = "#7193D9".toColor();
  static Color data_table_header_color = "#4ECDC4".toColor();
  static Color orange_colors = "#fed8b1".toColor();
  //static Color grayColor = "#b9fd88".toColor();
  static Color grayColor = "#E5E5E5".toColor();
  static Color blueColor = "#0180CD".toColor();
  static Color boarderBlue = "#00008B".toColor();
  static Color btnBlue = "##0180CD".toColor();

  static var devider= "#00008B".toColor();

  static var fillColor="#F4F4F4".toColor();
  static var whiteColor="#FFFFFF".toColor();

  static var green1="#0CD97B".toColor();
  static var green2="#0BA35E".toColor();

  static var blue1="#0A2F6A".toColor();
  static var blue2="#1955B8".toColor();
}
//#4ECDC4
extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class RandomColorModel {
  Random random = Random();

  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}
