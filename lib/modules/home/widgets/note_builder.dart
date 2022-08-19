import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notetaking_crud_app/modules/home/providers/note_appbar_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/models/note.dart';
import '../../../core/utils/theme.dart';
import '../../../shared/snack_bar.dart';
import '../../add_note/add_note.dart';
import '../providers/note_provider.dart';
import 'dismissible_bg.dart';
import 'note_card.dart';

class NoteBuilder extends StatelessWidget {
  const NoteBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyColors myColors = Theme.of(context).extension<MyColors>()!;
    final appBar = Provider.of<NoteAppbarProvider>(context);
    return Consumer<NoteProvider>(
      builder: (context, value, _) {
        return appBar.isGrid
            ? MasonryGridView.builder(
                itemCount: value.notes.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                primary: false,
                // mainAxisSpacing: 4,
                crossAxisSpacing: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNote(
                            content: value.notes[index].content,
                            id: value.notes[index].id,
                            title: value.notes[index].title,
                            color: value.notes[index].color,
                            date: value.notes[index].createDateTime,
                            // updateDate: value.notes[index].updateDateTime,
                          ),
                        ),
                      );
                    },
                    child: NoteCard(
                        color: value.notes[index].color,
                        text: value.notes[index].title!,
                        content: value.notes[index].content!,
                        createDateTime: value.notes[index].createDateTime!,
                        isEditted: value.notes[index].isEditted
                        // updateDateTime: value.notes[index].updateDateTime!,
                        ),
                  );
                },
              )
            : ListView.builder(
                itemCount: value.notes.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(value.notes[index].id!),
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.startToEnd) {
                        value.addNoteToFavorite(value.notes[index]);
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNote(
                              content: value.notes[index].content,
                              id: value.notes[index].id,
                              title: value.notes[index].title,
                              color: value.notes[index].color,
                              date: value.notes[index].createDateTime,
                              // updateDate: value.notes[index].updateDateTime,
                            ),
                          ),
                        );
                      },
                      child: NoteCard(
                          color: value.notes[index].color,
                          text: value.notes[index].title!,
                          content: value.notes[index].content!,
                          createDateTime: value.notes[index].createDateTime!,
                          isEditted: value.notes[index].isEditted
                          // updateDateTime: value.notes[index].updateDateTime!,
                          ),
                    ),
                  );
                });
      },
    );
  }
}
