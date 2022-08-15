import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Color? color;
  final String? text;
  final String? content;
  final DateTime? createDateTime;
  final bool? isEditted;

  const NoteCard({
    this.color,
    this.text,
    this.content,
    this.createDateTime,
    this.isEditted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text!,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
            child: Text(
              content!.length > 150
                  ? "${content!.substring(0, 150)}..."
                  : content!,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isEditted == true
                ? "last editted on ${createDateTime.toString()}"
                : "created on  ${createDateTime.toString()}",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
