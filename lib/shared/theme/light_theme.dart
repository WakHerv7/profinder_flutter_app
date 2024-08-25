import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'fade_through_transition.dart';
import 'fonts.dart';

IconThemeData customIconTheme(IconThemeData original) {
  return original.copyWith(
    color: AppColors.grayText,
  );
}

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true).copyWith(
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        minimumSize: const Size(120, 40),
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  return base.copyWith(
    brightness: Brightness.light,
    cardColor: AppColors.white,
    buttonTheme: const ButtonThemeData(
      colorScheme: AppColors.colorScheme,
      textTheme: ButtonTextTheme.normal,
      buttonColor: AppColors.primary,
    ),
    primaryColorLight: AppColors.white,
    primaryIconTheme: customIconTheme(base.iconTheme).copyWith(
      color: AppColors.black,
    ),
    iconTheme: customIconTheme(base.iconTheme).copyWith(
      color: AppColors.black,
    ),
    textTheme: buildTextTheme(
      base.textTheme,
    ),
    primaryTextTheme: buildTextTheme(
      base.primaryTextTheme,
    ),
    // hintColor: AppColors.hintColor,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    // dividerColor: AppColors.inputFillColors,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      titleTextStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarDividerColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
    dialogBackgroundColor: AppColors.white,
    colorScheme: AppColors.colorScheme,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: base.textTheme.labelLarge?.copyWith(
          // color: AppColors.hintColor,
          ),
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      contentPadding: const EdgeInsets.only(
        right: 10,
        top: 16,
        bottom: 16,
        left: 16,
      ),
    ),
  );
}
