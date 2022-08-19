import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/modules/home/providers/note_appbar_provider.dart';
import 'package:provider/provider.dart';

import '../../../shared/app_appbars/widgets/appbar_card_wih_icon.dart';

PreferredSizeWidget createHomeAppBar(
  BuildContext context, {
  required VoidCallback onMenuPreesed,
}) {
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
                  onPressed: onMenuPreesed,
                  tooltip: "Pop out sidebar",
                ),
              ),
              const SizedBox(width: 8),
              const Spacer(),
              // AppBarCardwithIcon(
              //   iconButton: IconButton(
              //     icon: Icon(
              //       Icons.search,
              //       color: Theme.of(context).iconTheme.color,
              //     ),
              //     onPressed: () {},
              //     tooltip: "Search",
              //   ),
              // ),
              // const SizedBox(width: 8),
              Consumer<NoteAppbarProvider>(builder: (context, value, child) {
                return AppBarCardwithIcon(
                  iconButton: IconButton(
                    icon: Icon(
                      value.isGrid
                          ? Icons.view_agenda_outlined
                          : Icons.grid_view,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () => value.toggleGrid(),
                    tooltip: "Change view",
                  ),
                );
              }),
              const SizedBox(width: 8),
              AppBarCardwithIcon(
                iconButton: IconButton(
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {},
                  tooltip: "Search",
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
