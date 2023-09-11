import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/colors.dart';
import '../model/notes_model.dart';
import 'edit_note_screen.dart';

class ShowNoteScreen extends StatelessWidget {
  ShowNoteScreen({Key? key, required this.noteIndex}) : super(key: key);

  final int noteIndex;
  final TextEditingController noteTextController = TextEditingController();
  final TextEditingController titleTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    double titleFontSize = size.width * 0.08;
    double noteFontSize = size.width * 0.055;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context, noteIndex),
        backgroundColor: const Color(greyColor),
        floatingActionButton: SizedBox(
          width: size.width * 0.25,
          height: size.width * 0.25,
          child: FittedBox(
            child: FloatingActionButton.extended(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNoteScreen(noteIndex: noteIndex),
                  )),
              label: const Text('Edit',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              icon: const Icon(Icons.edit),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06, vertical: size.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! note title textField
                // titleTextFormField(titleTextController),
                Padding(
                  padding: EdgeInsets.only(bottom: size.width * 0.03),
                  child: Text(
                    Hive.box<Note>('notes').getAt(noteIndex)!.title,
                    style: GoogleFonts.habibi(
                      color: Colors.white.withAlpha(215),
                      fontSize: titleFontSize,
                    ),
                  ),
                ),
                //! note text textField
                Padding(
                  padding: EdgeInsets.only(bottom: size.width * 0.02),
                  child: Text(
                    Hive.box<Note>('notes').getAt(noteIndex)!.text,
                    style: GoogleFonts.habibi(
                      color: Colors.white.withAlpha(190),
                      fontSize: noteFontSize,
                    ),
                  ),
                ),
                // noteTextFormField(noteTextController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, int index) {
    final size = MediaQuery.sizeOf(context);

    return AppBar(
      toolbarHeight: size.width * 0.2,
      leadingWidth: size.width * 0.24,
      leading: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.width * 0.04, horizontal: size.width * 0.06),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.03),
                color: Colors.grey.shade800),
            child: Icon(Icons.chevron_left, size: size.width * 0.1),
          ),
        ),
      ),
      elevation: 0,
      actions: [
        //! ========== delete note ==============================//
        Padding(
          padding: EdgeInsets.only(
              right: size.width * 0.04,
              top: size.width * 0.04,
              bottom: size.width * 0.04),
          child: GestureDetector(
            onTap: () {
              //! delete note
              Hive.box<Note>('notes').deleteAt(index);
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Note Deleted')));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                  color: Colors.red.shade900),
              child: const Icon(Icons.delete_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
