import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF003366);
  static const Color secondary = Color(0xffF57C00);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  // static const Color gray = Color(0xff4B5563);
  static const Color grayText = Color(0xff777777);
  static const Color grayTitle = Color(0xff424242);

  static const Color gray100 = Color(0xffF5F5F5);
  static Color gray200 = const Color(0xff777777).withOpacity(0.5);
  // static const Color gray300 = Color(0xffD1D5DB);

  static const Color red400 = Color(0xffB91C1C);
  static const Color green = Colors.green;

  static const ColorScheme colorScheme = ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.grayText,
    error: red400,
    onPrimary: AppColors.primary,
    onSecondary: AppColors.secondary,
    onSurface: AppColors.grayText,
    onError: white,
    brightness: Brightness.light,
  );
}
