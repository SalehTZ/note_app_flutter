import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'components/colors.dart';
import 'model/notes_model.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter<Note>(NoteAdapter());
  await Hive.openBox<Note>('notes');

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
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.amber,
            selectionColor: Colors.amber.withOpacity(0.3),
            selectionHandleColor: Colors.amber,
          )),
      home: Home(),
    );
  }
}
