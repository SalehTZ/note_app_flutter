import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/components/colors.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/screens/show_notes_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
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
                    noteColor: noteColors[note.color],
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
    required int? noteColor,
  })  : _size = size,
        _noteTitle = noteTitle,
        _noteDate = noteDate,
        _noteColor = noteColor,
        super(key: key);

  final Size? _size;
  final String? _noteTitle, _noteDate;
  final int? _noteColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_size!.width * 0.025),
      child: Container(
        padding: EdgeInsets.all(_size!.width * 0.02),
        color: Color(_noteColor!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                _noteTitle!,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: _size!.width * 0.1,
                  color: const Color(greyColor),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                _noteDate!,
                style: GoogleFonts.inter(
                    fontSize: _size!.width * 0.03,
                    color: const Color(greyColor).withOpacity(0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
