import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final bool? bold;
  final TextAlign? textAlign;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color = Constants.black,
    this.bold = false,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        textAlign: textAlign,
        style: GoogleFonts.roboto(
          fontSize: fontSize,
          color: color,
          fontWeight: bold! ? FontWeight.bold : FontWeight.normal,
        ));
  }
}
