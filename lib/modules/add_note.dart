import 'package:flutter/material.dart';

import '../shared/create_note_appBar.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateNoteAppBar("Add Note", context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            NoteTextField(
              fontSize: 40,
              text: "Title",
            ),
            NoteTextField(
              fontSize: 20,
              text: "Tell your future self about your day...",
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class NoteTextField extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final TextEditingController? textEditingController;

  const NoteTextField({
    Key? key,
    this.text,
    this.fontSize,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: Theme.of(context).textTheme.headline3,
      maxLines: null,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
