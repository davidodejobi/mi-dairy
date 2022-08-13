import 'package:flutter/material.dart';

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
