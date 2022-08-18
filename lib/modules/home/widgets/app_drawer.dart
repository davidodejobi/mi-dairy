import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/theme.dart';
import 'app_listtile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<NoteTheme>(context);
    return Drawer(
      backgroundColor: Theme.of(context).cardColor.withOpacity(0.9),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dairy Mi',
                      style: Theme.of(context).textTheme.headline2!),
                  IconButton(
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
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    AppListTile(
                      iconData: Icons.book,
                      title: 'Notes',
                      onPressed: () {},
                    ),
                    AppListTile(
                      iconData: Icons.star,
                      title: 'Favorite',
                      onPressed: () {},
                    ),
                    AppListTile(
                      iconData: Icons.notifications_active,
                      title: 'Reminders',
                      onPressed: () {},
                    ),
                    AppListTile(
                      iconData: Icons.calendar_month,
                      title: 'Calendar',
                      onPressed: () {},
                    ),
                    AppListTile(
                      iconData: Icons.recycling,
                      title: 'Trash',
                      onPressed: () {},
                    ),
                    const Divider(),
                    AppListTile(
                      iconData: Icons.question_mark,
                      title: 'About',
                      onPressed: () {},
                    ),
                    AppListTile(
                      iconData: Icons.settings,
                      title: 'Setting',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
