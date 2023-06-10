import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villages/assets/colors.dart';
import 'const_themes.dart';

ThemeData lightThemeData() => ThemeData(
      // textTheme: AppThemes.textTheme,
      inputDecorationTheme: AppThemes.inputDecorationTheme,
      scaffoldBackgroundColor: InUseColors.backgroundColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: InUseColors.componentsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 12.h,
        color: InUseColors.appBarColor,
        foregroundColor: InUseColors.componentsColor,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: InUseColors.componentsColor,
        ),
      ),
      colorScheme:
          const ColorScheme.light(background: InUseColors.backgroundColor),

      // elevatedButtonTheme: AppThemes.elevatedButtonTheme,
    );
