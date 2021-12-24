import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: _size!.width * 0.03,
        mainAxisSpacing: _size!.width * 0.03,
      ),
      itemBuilder: (context, index) {
        return GridTile(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_size!.width * 0.025),
            child: Container(
              padding: EdgeInsets.all(_size!.width * 0.01),
              color: Color(0xffFEC260),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'title of the notes should be here',
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      color: Color(greyColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Feb 01,2021',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(greyColor).withOpacity(0.5)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
