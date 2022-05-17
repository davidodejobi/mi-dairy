import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/shared/note_appbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar("Note", context),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
