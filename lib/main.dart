import 'package:flutter/material.dart';

import 'components/colors.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor themeColor = MaterialColor(greyColor, appThemeColors);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: themeColor,
      ),
      home: Home(),
    );
  }
}
