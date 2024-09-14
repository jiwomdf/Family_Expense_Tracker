import 'package:family_expense_tracker/util/app_color_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtil {
  BuildContext? _context;

  TextUtil(BuildContext context) {
    _context = context;
  }

  TextStyle? fontStyle({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      Theme.of(_context!).textTheme.bodyLarge?.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: color,
            decoration: decoration,
            decorationColor: decorationColor ?? AppColors.grey.systemDisable,
          );

  TextStyle? urbanist({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      GoogleFonts.urbanist(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor ?? AppColors.grey.systemDisable,
      );

  TextStyle? plusJakarta({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      GoogleFonts.plusJakartaSans(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor ?? AppColors.grey.systemDisable,
      );

  TextStyle? fontStylePoppin({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor ?? AppColors.grey.systemDisable,
      );
}
