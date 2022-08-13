import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/modules/add_note/provider/provider.dart';
import 'package:provider/provider.dart';

import '../../shared/create_note_appBar.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  FocusNode postNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateNoteAppBar("Add Note", context),
      body: Consumer<AddNoteProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              TextField(
                controller: value.titleController,
                style: Theme.of(context).textTheme.headline2,
                maxLines: null,
                decoration: const InputDecoration(
                    labelText: 'Title',
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(
                      fontSize: 40,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    hintText: ''),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      )),
                  child: Stack(
                    children: [
                      TextField(
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        controller: value.bodyController,
                        style: Theme.of(context).textTheme.headline3,
                        focusNode: postNode,
                        maxLines: null,
                        decoration: const InputDecoration(
                            labelText:
                                "Tell your future self about your day...",
                            alignLabelWithHint: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            hintText: ''),
                      ),
                      if (postNode.hasFocus)
                        Positioned(
                          right: 0,
                          top: -5,
                          child: IconButton(
                            onPressed: () => value.bodyController.clear(),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
