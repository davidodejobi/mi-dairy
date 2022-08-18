import 'package:flutter/material.dart';

import 'widgets/appbar_card_wih_icon.dart';

PreferredSizeWidget createAppBar(
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
              // AppBarCardwithIcon(
              //   iconButton: IconButton(
              //     icon: notifier.isDarkTheme
              //         ? const Icon(
              //             Icons.wb_sunny,
              //           )
              //         : const Icon(
              //             Icons.nightlight,
              //           ),
              //     onPressed: () => notifier.toggleTheme(),
              //     tooltip: "Toggle brightness",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ),
  );
}
