import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/colors_manager.dart';
import '../constants/styles_manager.dart';
import '../model/notes_model.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key, required this.noteIndex}) : super(key: key);

  final int noteIndex;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  Size? _size;

  final TextEditingController noteTextController = TextEditingController();

  final TextEditingController titleTextController = TextEditingController();

  int _noteColor = 0;
  @override
  void initState() {
    titleTextController.text =
        Hive.box<Note>('notes').getAt(widget.noteIndex)!.title;
    noteTextController.text =
        Hive.box<Note>('notes').getAt(widget.noteIndex)!.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.greyColor,
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

                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: ColorsManager.noteColors.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //! select note color
                          _noteColor = index;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: _noteColor == index
                                    ? Border.all(
                                        color: Colors.white,
                                        width: _size!.width * 0.01)
                                    : null,
                                color: ColorsManager.noteColors[index],
                                shape: BoxShape.circle),
                            width: 25,
                            height: 25,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.greyColor,
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
              if (titleTextController.text.isNotEmpty) {
                //! edit note in db
                final date = DateTime.now();
                String dateS =
                    '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}';
                //!!=============================================//
                final title = titleTextController.text.toString();
                final text = noteTextController.text.toString();
                Hive.box<Note>('notes').putAt(
                  widget.noteIndex,
                  Note(
                      title: title, text: text, date: dateS, color: _noteColor),
                );
                SnackBar snackBar = SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text('Note edited successfully',
                      style: TextStyle(fontSize: _size!.width * 0.04)),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
              } else {
                SnackBar snackBar = SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text('Title is empty!',
                      style: TextStyle(fontSize: _size!.width * 0.04)),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: _size!.width * 0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_size!.width * 0.03),
                  color: Colors.grey.shade800),
              child: Row(
                children: [
                  const Icon(Icons.done),
                  SizedBox(width: _size!.width * 0.01),
                  const Text('Done',
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
      style: TextStyles.getRegularStyle(
          color: Colors.grey.shade400, fontSize: noteFontSize),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Type something...',
        hintStyle: TextStyles.getRegularStyle(
            color: Colors.grey, fontSize: noteFontSize),
      ),
    );
  }

  TextFormField titleTextFormField(TextEditingController titleTextController) {
    double titleFontSize = _size!.width * 0.07;

    return TextFormField(
      controller: titleTextController,
      cursorColor: Colors.amber,
      style: TextStyles.getRegularStyle(
          color: Colors.grey.shade400, fontSize: titleFontSize),
      decoration: InputDecoration(
        hintText: 'Title',
        border: InputBorder.none,
        hintStyle: TextStyles.getRegularStyle(
            color: Colors.grey, fontSize: titleFontSize),
      ),
    );
  }
}
