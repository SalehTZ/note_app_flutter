class Note {
  final int? id;
  final String title;
  final String text;
  final String date;
  final int color;

  Note({
    required this.id,
    required this.title,
    required this.text,
    required this.date,
    required this.color,
  });

  // Convert a Note into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
    return 'Dog{id: $id, title: $title, text: $text, date: $date, color: $color}';
  }
}
