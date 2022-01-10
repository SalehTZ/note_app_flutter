import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../model/notes_model.dart';
import '../components/colors.dart';

class ShowNoteScreen extends StatelessWidget {
  ShowNoteScreen({Key? key, required this.noteIndex}) : super(key: key);

  final int noteIndex;
  Size? _size;
  final TextEditingController noteTextController = TextEditingController();
  final TextEditingController titleTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    double titleFontSize = _size!.width * 0.08;
    double noteFontSize = _size!.width * 0.055;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(greyColor),
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _size!.width * 0.06, vertical: _size!.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! note title textField
                // titleTextFormField(titleTextController),
                Padding(
                  padding: EdgeInsets.only(bottom: _size!.width * 0.03),
                  child: Text(
                    Hive.box<Note>('notes').getAt(noteIndex)!.title,
                    style: GoogleFonts.habibi(
                      color: Colors.grey.shade400,
                      fontSize: titleFontSize,
                    ),
                  ),
                ),
                //! note text textField
                Padding(
                  padding: EdgeInsets.only(bottom: _size!.width * 0.02),
                  child: Text(
                    Hive.box<Note>('notes').getAt(noteIndex)!.text,
                    style: GoogleFonts.habibi(
                      color: Colors.grey.shade400,
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: _size!.width * 0.2,
      leadingWidth: _size!.width * 0.24,
      leading: Padding(
        padding: EdgeInsets.symmetric(
            vertical: _size!.width * 0.04, horizontal: _size!.width * 0.06),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_size!.width * 0.03),
                color: Colors.grey.shade800),
            child: Icon(Icons.chevron_left, size: _size!.width * 0.1),
          ),
        ),
      ),
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: _size!.width * 0.04, horizontal: _size!.width * 0.06),
          child: GestureDetector(
            onTap: () {
              //! start editing note
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: _size!.width * 0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_size!.width * 0.03),
                  color: Colors.grey.shade800),
              child: Row(
                children: [
                  const Icon(Icons.edit),
                  SizedBox(width: _size!.width * 0.01),
                  const Text('Edit',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
