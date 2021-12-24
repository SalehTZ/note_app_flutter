import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/components/colors.dart';

import 'notes_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  Size? _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100.0,
        title: Text(
          "Notes",
          style: GoogleFonts.inter(fontSize: 35),
        ),
        centerTitle: false,
      ),
      body: Container(
        color: Color(greyColor),
        padding: EdgeInsets.symmetric(horizontal: _size!.width * 0.03),
        child: NotesScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('button pressed');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
