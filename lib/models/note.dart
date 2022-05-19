import 'package:flutter/material.dart';

class Note {
  String? id;
  String? title;
  String? content;
  DateTime? creatDateTime;
  DateTime? updateDateTime;
  Color? color;

  Note({
    this.id,
    this.title,
    this.content,
    this.creatDateTime,
    this.updateDateTime,
    this.color,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      creatDateTime: DateTime.parse(json['creatDateTime']),
      updateDateTime: DateTime.parse(json['updateDateTime']),
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['creatDateTime'] = creatDateTime?.toIso8601String();
    data['updateDateTime'] = updateDateTime?.toIso8601String();
    data['color'] = color;
    return data;
  }
}
