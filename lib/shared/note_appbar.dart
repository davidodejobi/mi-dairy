import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/models/theme.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget createAppBar(String title, BuildContext context) {
  var notifier = Provider.of<NoteTheme>(context);
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
        icon: notifier.isDark
            ? const Icon(Icons.wb_sunny_outlined)
            : const Icon(Icons.wb_sunny),
        onPressed: () => notifier.switchTheme(),
        tooltip: "Toggle brightness",
      ),
    ],
  );
}
