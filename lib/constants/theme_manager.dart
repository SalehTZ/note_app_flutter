import 'package:flutter/material.dart';

import 'colors_manager.dart';

// * Some of styles are commented for now.
// * Will be uncommented when decided on styles.
// ! Just added some starter theme attributes. Change them later
ThemeData getApplicationTheme() {
  return ThemeData(
    // * Material 3
    useMaterial3: false,

    // * Main app colors
    primaryColor: ColorsManager.primaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.orange600,
    ),
    // * Scaffold background color
    scaffoldBackgroundColor: ColorsManager.greyColor,

    // * Text Selection theme (text form field)
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.orange600,
      selectionColor: Colors.orange.withOpacity(0.3),
      selectionHandleColor: ColorsManager.orange600,
    ),

    // * Input decoration theme (text form field)
    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.only(bottom: AppPadding.p8),
    //   hintStyle: TextStyles.getSearchBarHintTextStyle(),
    //   labelStyle: TextStyles.getSearchBarTextStyle(),
    //   errorStyle: TextStyles.getSearchBarTextStyle(color: ColorManager.error),
    // ),
  );
}
