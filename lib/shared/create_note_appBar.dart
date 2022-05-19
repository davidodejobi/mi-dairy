import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/providers/theme.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget createNoteAppBar(String title, BuildContext context) {
  var notifier = Provider.of<NoteTheme>(context);
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Card(
        color: Theme.of(context).cardColor,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    ),
    actions: [
      Card(
        color: Theme.of(context).cardColor,
        child: IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {},
        ),
      ),
      const SizedBox(width: 8),
      Card(
        color: Theme.of(context).cardColor,
        child: IconButton(
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
      ),
      const SizedBox(width: 8),
    ],
  );
}
