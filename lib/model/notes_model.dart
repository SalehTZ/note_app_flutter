import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class Note {
  // @HiveField(0)
  // final int? id;
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  Note({
    // required this.id,
    required this.title,
    required this.text,
    required this.date,
    required this.color,
  });

  // Convert a Note into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'title': title,
      'text': text,
      'date': date,
      'color': color,
    };
  }

  // Implement toString to make it easier to see information about
  // each row when using the print statement.
  @override
  String toString() {
    return 'Dog{title: $title, text: $text, date: $date, color: $color}';
  }
}
