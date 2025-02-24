import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_constants.dart';

Widget customText(
    {String? text,
    String? fontFamily,
    TextStyle? style,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? txtDecoration,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? decorationColor,
    double? letterSpacing,
    TextDirection? textDirection,
    int? maxLines}) {
  return Text(
    text!,
    textAlign: textAlign,
    textDirection: textDirection,
    maxLines: maxLines,
    overflow: overflow,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: GoogleFonts.inter().fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: txtDecoration,
      decorationColor: decorationColor,
      decorationThickness: 2.0,
      letterSpacing: letterSpacing,
    ),
  );
}

void showSuccess(String message) {
  Get.snackbar(
    'Success',
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: ColorConstants.primaryColor,
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
  );
}