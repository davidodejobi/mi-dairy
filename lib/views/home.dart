import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/shared/note_appbar.dart';

import 'package:notetaking_crud_app/providers/note_provider.dart';
import 'package:notetaking_crud_app/shared/snack_bar.dart';
import 'package:notetaking_crud_app/views/add_note.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../providers/theme.dart';
import '../widgets/dismissible_bg.dart';
import '../widgets/note_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyColors myColors = Theme.of(context).extension<MyColors>()!;

    return Scaffold(
      key: key,
      appBar: createAppBar("Dairy Mi", context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNote(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<NoteProvider>(
        builder: (context, value, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: value.notes.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/rafiki.png",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create your first note !",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: value.notes.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(value.notes[index].id!),
                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.startToEnd) {
                          } else {
                            Note deleteNote = value.delete(
                              index,
                              value.notes[index].id!,
                            );

                            showSnackBar(
                              onPressed: () {
                                value.undoDelete(index, deleteNote);
                              },
                              context: context,
                              bgColor: deleteNote.color,
                              text: "Deleted",
                              textColor: myColors.snackBarActionColor,
                            );
                          }
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            return false;
                          } else if (direction == DismissDirection.endToStart) {
                            return true;
                          }
                          return null;
                        },
                        background: const DismissibleBG(
                          animations: "favorite-star",
                          mainAL: MainAxisAlignment.start,
                          size: 30,
                        ),
                        secondaryBackground: const DismissibleBG(
                          animations: "delete-can",
                          mainAL: MainAxisAlignment.end,
                          size: 20,
                        ),
                        child: NoteCard(
                          color: value.notes[index].color,
                          text: value.notes[index].title!,
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
