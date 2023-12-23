import 'package:flutter/material.dart';

class ColorsManager {
  static const purpleColor = Color(0xFF880E4F);
  static const greyColor = Color(0xFF171717);
  static const grey = Colors.grey;
  static const white = Colors.white;

  // * Variants
  static final grey400 = Colors.grey.shade400;
  static final orange600 = Colors.orange.shade600;
  static final orangeO3 = Colors.orange.withOpacity(0.3);
  static final whiteA215 = Colors.white.withAlpha(215);

  static Color primaryMaterial = HexColor.toMaterialColor(0xffd89116);
  static const Color primaryColor = Color(0xffd89116);

  static const Map<int, Color> appThemeColors = {
    50: Color.fromRGBO(216, 146, 22, .1),
    100: Color.fromRGBO(216, 146, 22, .2),
    200: Color.fromRGBO(216, 146, 22, .3),
    300: Color.fromRGBO(216, 146, 22, .4),
    400: Color.fromRGBO(216, 146, 22, .5),
    500: Color.fromRGBO(216, 146, 22, .6),
    600: Color.fromRGBO(216, 146, 22, .7),
    700: Color.fromRGBO(216, 146, 22, .8),
    800: Color.fromRGBO(216, 146, 22, .9),
    900: Color.fromRGBO(216, 146, 22, 1),
  };

  static const List<Color> noteColors = [
    Color(0xFFFEC260),
    Color(0xFFE9A6A6),
    Color(0xFFF38EB0),
    Color(0xFF519872),
    Color(0xFFFFAB91),
    Color(0xFFE6EE9B),
    Color(0xFFCF93D9),
  ];
}

extension HexColor on Color {
  /// Convert any Hex color to Material Color.
  static MaterialColor toMaterialColor(int hexColorString) {
    final color = Color(hexColorString);
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}
