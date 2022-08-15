import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/models/note.dart';

final random = Random();

class NoteProvider with ChangeNotifier {
  Color? color = Colors.primaries[random.nextInt(Colors.primaries.length)]
      [random.nextInt(2) * 2];

  final _notes = [
    Note(
      color: Colors.primaries[random.nextInt(Colors.primaries.length)]
          [random.nextInt(9) * 100],
      id: '1',
      title: 'Fusce vulputate eleifend',
      content:
          '''Quisque ut nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vitae orci sed dolor rutrum auctor..

Quisque ut nisi. Vivamus elementum semper nisi. Etiam sollicitudin, ipsum eu pulvinar rutrum, tellus ipsum laoreet sapien, quis venenatis ante odio sit amet eros. Nunc nulla.

In dui magna, posuere eget, vestibulum et, tempor auctor, justo. Nunc interdum lacus sit amet orci. Fusce vel dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.''',
      createDateTime: DateTime.now(),
      isEditted: false,
    ),
    Note(
      color: Colors.primaries[random.nextInt(Colors.primaries.length)]
          [random.nextInt(9) * 100],
      id: '2',
      title:
          'Donec posuere vulputate arcu. Donec posuere vulputate arcu. Donec posuere vulputate arcu.',
      content:
          '''Quisque ut nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vitae orci sed dolor rutrum auctor..

Quisque ut nisi. Vivamus elementum semper nisi. Etiam sollicitudin, ipsum eu pulvinar rutrum, tellus ipsum laoreet sapien, quis venenatis ante odio sit amet eros. Nunc nulla.

In dui magna, posuere eget, vestibulum et, tempor auctor, justo. Nunc interdum lacus sit amet orci. Fusce vel dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.''',
      createDateTime: DateTime.now(),
      isEditted: false,
    ),
    Note(
      color: Colors.primaries[random.nextInt(Colors.primaries.length)]
          [random.nextInt(9) * 100],
      id: '3',
      title: 'Book Review : The Design of Everyday Things by Don Norman',
      content:
          '''Quisque ut nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec vitae orci sed dolor rutrum auctor..

Quisque ut nisi. Vivamus elementum semper nisi. Etiam sollicitudin, ipsum eu pulvinar rutrum, tellus ipsum laoreet sapien, quis venenatis ante odio sit amet eros. Nunc nulla.

In dui magna, posuere eget, vestibulum et, tempor auctor, justo. Nunc interdum lacus sit amet orci. Fusce vel dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.''',
      createDateTime: DateTime.now(),
      isEditted: false,
    ),
  ];

  List<Note> get notes {
    return [..._notes];
  }

  Note findById(String id) {
    return _notes.firstWhere((note) => note.id == id);
  }

  void addNote(
    String title,
    String content,
    Color color,
  ) {
    _notes.add(
      Note(
        title: title,
        content: content,
        color: color,
        id: DateTime.now().toString(),
        createDateTime: DateTime.now(),
        isEditted: false,
      ),
    );
    notifyListeners();
  }

  void updateNote(
    String id,
    String title,
    String content,
    Color color,
  ) {
    final noteIndex = _notes.indexWhere((note) => note.id == id);
    if (noteIndex >= 0) {
      _notes[noteIndex] = Note(
        title: title,
        content: content,
        color: color,
        id: DateTime.now().toString(),
        createDateTime: DateTime.now(),
        isEditted: true,
      );
      notifyListeners();
    } else {
      if (kDebugMode) {
        print('Note not found');
      }
    }
  }

  Note delete(int i, String id) {
    Note deletedNote = notes[i];
    if (id == notes[i].id) {
      _notes.removeAt(i);
    }
    notifyListeners();
    return deletedNote;
  }

  // void deleteNote(String id) {
  //   _notes.removeWhere((note) => note.id == id);
  //   notifyListeners();
  // }

  void undoDelete(int index, Note note) {
    _notes.insert(index, note);
    notifyListeners();
  }
}
