import 'package:flutter/material.dart';

import 'colors_manager.dart';
import 'fonts_manager.dart';

class TextStyles {
  static TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color color,
    double height,
    List<Shadow> shadows,
  ) =>
      TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          height: height,
          shadows: shadows);

  // * regular style
  static TextStyle getRegularStyle({
    double fontSize = FontSize.s12,
    Color color = ColorsManager.grey,
    double height = FontHeight.h1,
    List<Shadow>? shadows,
  }) =>
      _getTextStyle(
        fontSize,
        FontConstants.fontFamily,
        FontWeightManager.regular,
        color,
        height,
        shadows ?? [],
      );

  // * Semi bold text style
  static TextStyle getSemiBoldStyle({
    double fontSize = FontSize.s12,
    Color color = ColorsManager.grey,
    double height = FontHeight.h1,
    List<Shadow>? shadows,
  }) =>
      _getTextStyle(
        fontSize,
        FontConstants.fontFamily,
        FontWeightManager.semiBold,
        color,
        height,
        shadows ?? [],
      );

  // * bold text style
  static TextStyle getBoldStyle({
    double fontSize = FontSize.s16,
    Color color = ColorsManager.grey,
    double height = FontHeight.h1,
    List<Shadow>? shadows,
  }) =>
      _getTextStyle(
        fontSize,
        FontConstants.fontFamily,
        FontWeightManager.bold,
        color,
        height,
        shadows ?? [],
      );
}
