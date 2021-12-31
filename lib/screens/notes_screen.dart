import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/components/colors.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  Size? _size;
  String? _noteTitle, _noteDate;
  int? _noteColor;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _noteTitle = 'Title of the notes should be here.';
    _noteDate = 'Feb 01,2021';
    _noteColor = noteColors[0];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: _size!.width * 0.03,
        mainAxisSpacing: _size!.width * 0.03,
      ),
      itemBuilder: (context, index) {
        return GridTile(
          child: NotesTile(
              size: _size,
              noteTitle: _noteTitle,
              noteDate: _noteDate,
              noteColor: _noteColor),
        );
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
        padding: EdgeInsets.all(_size!.width * 0.01),
        color: Color(_noteColor!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _noteTitle!,
              style: GoogleFonts.raleway(
                fontSize: 20,
                color: const Color(greyColor),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                _noteDate!,
                style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(greyColor).withOpacity(0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
