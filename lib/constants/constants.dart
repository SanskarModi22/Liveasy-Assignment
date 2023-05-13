import 'package:flutter/material.dart';

class Constants {
  static const String galleryImg = "assets/gallery_img.png";
  static const String indiaFlag = "assets/india_flag.png";
  static const String page1Vector = "assets/pg1_bottom.png";
  static const String page2Vector = "assets/pg2_bottom.png";
  static const String page3Vector = "assets/pg3_bottom.png";
  static const String shipperImg = "assets/shipper_img.png";
  static const String transporterImg = "assets/transporter_img.png";

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF6A6C7B);
  static const Color blue = Color(0xFF2E3B62);
  static const Color lightBlue = Color(0xFF93D2F3);
}
