import 'package:flutter/material.dart';

class Note {
  String? id;
  String? title;
  String? content;
  DateTime? createDateTime;
  Color? color;
  bool? isEditted;

  Note({
    this.id,
    this.title,
    this.content,
    this.createDateTime,
    this.color,
    this.isEditted,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createDateTime: DateTime.parse(json['creatDateTime']),
      // updateDateTime: DateTime.parse(json['updateDateTime']),
      color: json['color'],
      isEditted: json['isEditted'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['creatDateTime'] = createDateTime?.toIso8601String();
    // data['updateDateTime'] = updateDateTime?.toIso8601String();
    data['color'] = color;
    data['isEditted'] = isEditted;
    return data;
  }
}
