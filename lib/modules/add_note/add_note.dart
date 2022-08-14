import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/modules/add_note/provider/add_note_provider.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../../shared/create_note_appBar.dart';
import '../home/providers/note_provider.dart';

AddNoteProvider addNoteProvider = getIt<AddNoteProvider>();

class AddNote extends StatefulWidget {
  final String? id;
  final String? title;
  final String? content;
  const AddNote({
    Key? key,
    this.id,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late TextEditingController _titleController;
  late TextEditingController _bodyController;
  @override
  void initState() {
    _titleController = TextEditingController();
    _bodyController = TextEditingController();

    setState(() {
      _titleController = TextEditingController(text: widget.title);
      _bodyController = TextEditingController(text: widget.content);
    });
    super.initState();
  }

  FocusNode postNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final anp = Provider.of<AddNoteProvider>(context);
    final np = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: CreateNoteAppBar(
        "Add Note",
        context,
        onPressed: () {
          if (widget.id != null) {
            np.updateNote(widget.id!, _titleController.text,
                _bodyController.text, anp.color);
          } else {
            np.addNote(
              _titleController.text,
              _bodyController.text,
              anp.color,
            );
          }
          // np.addNote(
          //   anp.titleController.text,
          //   anp.bodyController.text,
          // );
        },
        onPop: () {
          Navigator.pop(context);
          anp.onPopAction();
        },
      ),
      body: Consumer<AddNoteProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
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
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF17191D),
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          )),
                      child: TextField(
                        onTap: () =>
                            FocusScope.of(context).requestFocus(postNode),
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        controller: _bodyController,
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
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      //   );
    );
  }
}
