import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/providers/theme.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget createAppBar(String title, BuildContext context) {
  var notifier = Provider.of<NoteTheme>(context);
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline2,
    ),
    actions: [
      IconButton(
        icon: notifier.isDarkTheme
            ? const Icon(
                Icons.wb_sunny,
                color: Colors.white,
              )
            : const Icon(
                Icons.nightlight,
              ),
        onPressed: () => notifier.toggleTheme(),
        tooltip: "Toggle brightness",
      ),
    ],
  );
}
