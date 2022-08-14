import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/core/utils/theme.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget CreateNoteAppBar(
  String title,
  BuildContext context, {
  VoidCallback? onPressed,
  VoidCallback? onPop,
}) {
  var notifier = Provider.of<NoteTheme>(context);
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: onPop,
                ),
              ),
              const Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.color_lens,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {},
                  tooltip: 'Change note color',
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.save,
                  ),
                  onPressed: onPressed,
                  tooltip: "Save",
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
