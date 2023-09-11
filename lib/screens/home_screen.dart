import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/components/colors.dart';
import 'package:note_app/screens/new_note_screen.dart';

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
          style: GoogleFonts.inter(fontSize: 35),
        ),
        centerTitle: false,
      ),
      body: Container(
        color: const Color(greyColor),
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
