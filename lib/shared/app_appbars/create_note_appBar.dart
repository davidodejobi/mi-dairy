// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/shared/app_appbars/widgets/appbar_card_wih_icon.dart';
import 'package:provider/provider.dart';

import '../../modules/add_note/provider/add_note_provider.dart';
import 'widgets/colors_alert_dialog.dart';

PreferredSizeWidget createNoteAppBar(
  String title,
  BuildContext context, {
  VoidCallback? onPressed,
  VoidCallback? onPop,
  Color color = Colors.transparent,
}) {
  final anp = Provider.of<AddNoteProvider>(context);
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              AppBarCardwithIcon(
                iconButton: IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: onPop,
                ),
              ),
              const Spacer(),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: anp.color == Colors.transparent
                      ? Theme.of(context).cardColor
                      : anp.color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.color_lens,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  tooltip: 'Change note color',
                ),
              ),
              const SizedBox(width: 8),
              AppBarCardwithIcon(
                iconButton: IconButton(
                  icon: const Icon(
                    Icons.filter_list,
                  ),
                  onPressed: onPressed,
                  tooltip: "Save",
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
