import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/colors_manager.dart';
import '../constants/styles_manager.dart';
import '../model/notes_model.dart';
import 'show_notes_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  Size? _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    // final _globalKey = GlobalKey<_NotesScreenState>();

    return ValueListenableBuilder(
      valueListenable: Hive.box<Note>('notes').listenable(),
      builder: (BuildContext context, Box<Note> box, _) {
        if (box.length != 0) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: _size!.width * 0.03,
              mainAxisSpacing: _size!.width * 0.03,
            ),
            itemCount: box.length,
            itemBuilder: (context, index) {
              final note = box.getAt(index);
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowNoteScreen(noteIndex: index)),
                ),
                child: GridTile(
                  child: NotesTile(
                    size: _size,
                    noteTitle: note!.title,
                    noteDate: note.date,
                    noteColor: ColorsManager.noteColors[note.color],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text(
              'Add some notes!',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
        }
      },
    );
  }
}

class NotesTile extends StatelessWidget {
  const NotesTile({
    Key? key,
    required Size? size,
    required String? noteTitle,
    required String? noteDate,
    required Color? noteColor,
  })  : _size = size,
        _noteTitle = noteTitle,
        _noteDate = noteDate,
        _noteColor = noteColor,
        super(key: key);

  final Size? _size;
  final String? _noteTitle, _noteDate;
  final Color? _noteColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_size!.width * 0.025),
      child: Container(
        padding: EdgeInsets.all(_size!.width * 0.02),
        color: _noteColor!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                _noteTitle!,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: TextStyles.getRegularStyle(
                  fontSize: _size!.width * 0.1,
                  color: ColorsManager.greyColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                _noteDate!,
                style: TextStyles.getRegularStyle(
                  fontSize: _size!.width * 0.03,
                  color: ColorsManager.greyColor.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
