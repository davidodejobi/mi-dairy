import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/shared/app_appbars/note_appbar.dart';

import 'package:provider/provider.dart';

import '../add_note/add_note.dart';
import 'providers/note_provider.dart';
import 'widgets/app_drawer.dart';
import 'widgets/empty_note.dart';
import 'widgets/note_builder.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: createAppBar(
        context,
        onMenuPreesed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNote(
                color: Theme.of(context).cardColor,
              ),
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
            child:
                value.notes.isEmpty ? const EmptyNote() : const NoteBuilder(),
          );
        },
      ),
    );
  }
}
