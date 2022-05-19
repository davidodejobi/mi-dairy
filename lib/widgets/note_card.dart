import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Color? color;
  final String? text;

  const NoteCard({
    this.color,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text!,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
