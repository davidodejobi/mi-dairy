import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/core/utils/theme.dart';
import 'package:provider/provider.dart';

import 'widgets/appbar_card_wih_icon.dart';

PreferredSizeWidget createAppBar(
  String title,
  BuildContext context,
) {
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
              AppBarCardwithIcon(
                iconButton: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {},
                  tooltip: "Pop out sidebar",
                ),
              ),
              const SizedBox(width: 8),
              Text(title, style: Theme.of(context).textTheme.headline3!),
              const Spacer(),
              AppBarCardwithIcon(
                iconButton: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {},
                  tooltip: "Search",
                ),
              ),
              const SizedBox(width: 8),
              AppBarCardwithIcon(
                iconButton: IconButton(
                  icon: notifier.isDarkTheme
                      ? const Icon(
                          Icons.wb_sunny,
                        )
                      : const Icon(
                          Icons.nightlight,
                        ),
                  onPressed: () => notifier.toggleTheme(),
                  tooltip: "Toggle brightness",
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
