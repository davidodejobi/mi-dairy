import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/note_colors.dart';
import '../modules/add_note/provider/add_note_provider.dart';

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
                    print('I got pressed');
                    showAlertDialog(context);
                  },
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

showAlertDialog(BuildContext context) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: SizedBox(
      height: 400,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Provider.of<AddNoteProvider>(context, listen: false)
                      .changeNoteColor(colors[index]);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
          )),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
