import 'package:flutter/material.dart';
import 'package:villages/assets/colors.dart';

/// | NAME       | SIZE |  WEIGHT |  SPACING |             |
/// |------------|------|---------|----------|-------------|
/// | headline1  | 96.0 | light   | -1.5     |             |
/// | headline2  | 60.0 | light   | -0.5     |             |
/// | headline3  | 48.0 | regular |  0.0     |             |
/// | headline4  | 34.0 | regular |  0.25    |             |
/// | headline5  | 24.0 | regular |  0.0     |             |
/// | headline6  | 20.0 | medium  |  0.15    |             |
/// | subtitle1  | 16.0 | regular |  0.15    |             |
/// | subtitle2  | 14.0 | medium  |  0.1     |             |
/// | body1      | 16.0 | regular |  0.5     | (bodyText1) |
/// | body2      | 14.0 | regular |  0.25    | (bodyText2) |
/// | button     | 14.0 | medium  |  1.25    |             |
/// | caption    | 12.0 | regular |  0.4     |             |
/// | overline   | 10.0 | regular |  1.5     |             |

// displayLarge: Styles.textStyle14, //96
// displayMedium: Styles.textStyle14, //60
// displaySmall: Styles.textStyle14, //48
// headlineLarge: Styles.textStyle14,
// labelMedium: Styles.textStyle14,
// bodyLarge: Styles.textStyle16,//16.0

class AppThemes {
  // static TextTheme textTheme = TextTheme(
  //   headlineMedium: Styles.textStyle32, //34
  //   headlineSmall: Styles.textStyle28, //24
  //   titleLarge: Styles.textStyle22, //20.0
  //   titleMedium: Styles.textStyle18, //16.0======>18
  //   titleSmall: Styles.textStyle16, //14.0
  //   labelLarge: Styles.textStyle15, //14.0======>15
  //   bodyMedium: Styles.textStyle14, //14.0
  //   bodySmall: Styles.textStyle12, //12.0
  //   labelSmall: Styles.textStyle15, //10.0
  // );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: const TextStyle(color: Colors.amber, height: 1.47),
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsetsDirectional.only(
        top: 10, bottom: 10, start: 20.0, end: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        width: 1,
        color: InUseColors.componentsColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: InUseColors.componentsColor,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: InUseColors.componentsColor,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: InUseColors.componentsColor,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
  );

  // static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     textStyle:
  //         MaterialStateProperty.all(Styles.textStyle18.copyWith(height: 5.4)),
  //     alignment: Alignment.center,
  //     padding:
  //         MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10.h)),
  //     backgroundColor: MaterialStateProperty.all(AppColors.kCeladonGreen),
  //   ),
  // );
}
