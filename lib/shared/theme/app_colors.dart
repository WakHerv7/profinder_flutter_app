import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF292826);
  static const Color secondary = Color(0xff978D00);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color gray = Color(0xff4B5563);
  static const Color grayText = Color(0xffA2A7AF);

  static const Color gray100 = Color(0xffF3F4F6);
  static const Color gray200 = Color(0xffE5E7EB);
  static const Color gray300 = Color(0xffD1D5DB);

  static const Color red400 = Color(0xffB91C1C);
  static const Color green = Colors.green;

  static const ColorScheme colorScheme = ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.white,
    error: red400,
    onPrimary: AppColors.primary,
    onSecondary: AppColors.primary,
    onSurface: AppColors.primary,
    onError: white,
    brightness: Brightness.light,
  );
}
