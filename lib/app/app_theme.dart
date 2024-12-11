import 'package:family_expense_tracker/util/style/app_color_util.dart';
import 'package:flutter/material.dart';

final ThemeData defaultThemeData = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: AppColors.blue.bgDarkBlue,
  scaffoldBackgroundColor: AppColors.white.primary,
  cardColor: AppColors.purple.bgLightPurple,
  canvasColor: AppColors.purple.bgLightPurple,
  dialogBackgroundColor: AppColors.white.primary,
);

final ThemeData darkThemeData = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  scaffoldBackgroundColor: AppColors.blue.bgDarkBlue,
  cardColor: AppColors.blue.bgCardDarkBlue,
  canvasColor: AppColors.blue.bgCardDarkBlue,
  dialogBackgroundColor: AppColors.blue.bgDarkBlue,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark, // <-- the only line added
    seedColor: AppColors.blue.bgDarkBlue,
  ),
);
