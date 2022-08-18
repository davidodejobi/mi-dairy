import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/note_colors.dart';
import '../../../modules/add_note/provider/add_note_provider.dart';

showAlertDialog(BuildContext context) {
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
