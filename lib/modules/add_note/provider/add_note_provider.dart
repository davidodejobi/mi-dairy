import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/modules/home/providers/note_provider.dart';

class AddNoteProvider with ChangeNotifier {
  NoteProvider np = NoteProvider();
  // NoteProvider np = getIt<NoteProvider>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  // void addNote() {
  //   print('titleController: ${titleController.text}');
  //   print('bodyController: ${bodyController.text}');
  //   np.notes.add(
  //     Note(
  //       title: titleController.text,
  //       content: bodyController.text,
  //       color: Colors.teal,
  //       id: DateTime.now().toString(),
  //       createDateTime: DateTime.now(),
  //       updateDateTime: DateTime.now(),
  //     ),
  //   );
  //   notifyListeners();
  // }
}
