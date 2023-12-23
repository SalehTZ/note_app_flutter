import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants/colors_manager.dart';
import '../constants/styles_manager.dart';
import '../model/notes_model.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({Key? key}) : super(key: key);

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  Size? _size;

  final TextEditingController noteTextController = TextEditingController();

  final TextEditingController titleTextController = TextEditingController();

  int _noteColor = 0;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                //! save note to db
                final date = DateTime.now();
                String dateS =
                    '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}';
                //!!=============================================//
                final title = titleTextController.text.toString();
                final text = noteTextController.text.toString();
                int key = Hive.box<Note>('notes').length;
                debugPrint(key.toString());
                Hive.box<Note>('notes').put(
                  key + 1,
                  Note(
                      title: title, text: text, date: dateS, color: _noteColor),
                );
                Navigator.pop(context);
              } else {
                SnackBar snackBar = SnackBar(
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
                  color: ColorsManager.grey.shade800),
              child: Row(
                children: [
                  const Icon(Icons.save),
                  SizedBox(width: _size!.width * 0.01),
                  Text('Save', style: TextStyles.getBoldStyle()),
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
        color: ColorsManager.grey.shade400,
        fontSize: noteFontSize,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Type something...',
        hintStyle: TextStyles.getRegularStyle(
          color: ColorsManager.grey,
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
      style: TextStyles.getRegularStyle(
        color: ColorsManager.grey.shade400,
        fontSize: titleFontSize,
      ),
      decoration: InputDecoration(
        hintText: 'Title',
        border: InputBorder.none,
        hintStyle: TextStyles.getRegularStyle(
          color: ColorsManager.grey,
          fontSize: titleFontSize,
        ),
      ),
    );
  }
}
