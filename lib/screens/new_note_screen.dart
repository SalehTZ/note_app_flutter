import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:note_app/components/colors.dart';
import 'package:note_app/model/notes_model.dart';

class NewNoteScreen extends StatelessWidget {
  NewNoteScreen({Key? key}) : super(key: key);

  Size? _size;
  final TextEditingController noteTextController = TextEditingController();
  final TextEditingController titleTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(greyColor),
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _size!.width * 0.06, vertical: _size!.width * 0.02),
            child: Column(
              children: [
                //! note title textField
                titleTextFormField(titleTextController),
                //! note text textField
                noteTextFormField(noteTextController),
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
            onTap: () async {
              //! save note to db
              final date = DateTime.now();
              String dateS = date.year.toString() +
                  '-' +
                  date.month.toString() +
                  '-' +
                  date.day.toString() +
                  ' ' +
                  date.hour.toString() +
                  ':' +
                  date.minute.toString() +
                  ':' +
                  date.second.toString();
              // Map<String, dynamic> row = {
              //   'title': titleTextController.text.toString(),
              //   'text': noteTextController.text.toString(),
              //   'date': dateS,
              //   'color': 1,
              // };
              final title = titleTextController.text.toString();
              final text = noteTextController.text.toString();
              const color = 1;

              Hive.box<Note>('notes').add(
                Note(title: title, text: text, date: dateS, color: color),
              );
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: _size!.width * 0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_size!.width * 0.03),
                  color: Colors.grey.shade800),
              child: Row(
                children: [
                  const Icon(Icons.save),
                  SizedBox(width: _size!.width * 0.01),
                  const Text('Save',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  TextFormField noteTextFormField(TextEditingController noteTextController) {
    double noteFontSize = _size!.width * 0.055;
    return TextFormField(
      controller: noteTextController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textAlign: TextAlign.start,
      style: GoogleFonts.habibi(
        color: Colors.grey.shade400,
        fontSize: noteFontSize,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Type something...',
        hintStyle: GoogleFonts.habibi(
          color: Colors.grey,
          fontSize: noteFontSize,
        ),
      ),
    );
  }

  TextFormField titleTextFormField(TextEditingController titleTextController) {
    double titleFontSize = _size!.width * 0.07;

    return TextFormField(
      controller: titleTextController,
      cursorColor: Colors.amber,
      style: GoogleFonts.habibi(
        color: Colors.grey.shade400,
        fontSize: titleFontSize,
      ),
      decoration: InputDecoration(
        hintText: 'Title',
        border: InputBorder.none,
        hintStyle: GoogleFonts.habibi(
          color: Colors.grey,
          fontSize: titleFontSize,
        ),
      ),
    );
  }
}
