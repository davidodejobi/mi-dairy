import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/core/utils/theme.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget createAppBar(String title, BuildContext context) {
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
              Text(title, style: Theme.of(context).textTheme.headline3!),
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
                    Icons.search,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {},
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
            ],
          ),
        ),
      ),
    ),
  );
}
