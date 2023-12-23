import 'package:flutter/material.dart';

import '../constants/colors_manager.dart';
import '../constants/fonts_manager.dart';
import '../constants/styles_manager.dart';
import 'new_note_screen.dart';
import 'notes_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: size.width * 0.3,
        title: Text(
          "Notes",
          style: TextStyles.getRegularStyle(fontSize: FontSize.s34),
        ),
        centerTitle: false,
      ),
      body: Container(
        color: ColorsManager.greyColor,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: const NotesScreen(),
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.15,
        height: size.width * 0.15,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewNoteScreen(),
                )),
            child: const Icon(Icons.add, size: 30),
          ),
        ),
      ),
    );
  }
}
