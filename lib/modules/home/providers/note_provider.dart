import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/note_colors.dart';
import '../../../core/models/note.dart';

final random = Random();

class NoteProvider with ChangeNotifier {
  final _notes = [
    Note(
      color: colors[random.nextInt(colors.length + 1)],
      id: '1',
      title: 'The cat ate my source code',
      content:
          "Rule 2: Try as much as possible to share snippet of some problem (especially the ones you find challenging while working on the project) with the community: After the cat ate my source code, I lost every single thing I wrote for the project I was working on for like 2+ weeks and the deadline was fast approaching (which even worsen the case). Here's what helped me, I had some of my main and useful snippet stored, so when this happened, I was able to retrieve some of those snippet and use them as a guide to get back on route. The other way I am just planning to adopt which is more efficiemt is by sharing solutions to blocker you had when you are working on a project. That way, you stored the snippet online and you also get feedback from other on better ways you could solve the problem.",
      createDateTime: DateTime.now(),
      isEditted: false,
    ),
    Note(
      color: colors[random.nextInt(colors.length + 1)],
      id: '2',
      title: 'back it up with a reasonable planning to work on',
      content:
          r"back it up with a reasonable solution you are working on/planning to work on. In my case, I had break the new to my team mate and tell them what I've done so far and how I plan to rewite the code that was eaten by the cat after retrieving my laptop from the engineer.",
      createDateTime: DateTime.now(),
      isEditted: false,
    ),
    Note(
      color: colors[random.nextInt(colors.length + 1)],
      id: '3',
      title: 'Book Review : The Design of Everyday Things by Don Norman',
      content:
          "Rule 3: Be reliable : One thing I've learned so far when joining a new team (be it an hackathon or a new workpalce), is to make the other member view me as a relaible team member. This doesn't neccessaryly means you don't have any bugs in your code or you always clear your Jira tickets because you could do those, and not still be reliable. It simple means people can trust you and know that when you say something (maybe to fix a bug, or not getting a task done cause of a major blocker) you will follow your words with actions, that's what being reliable means.",
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
