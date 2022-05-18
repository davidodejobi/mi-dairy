import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/shared/note_appbar.dart';

import '../providers/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyColors myColors = Theme.of(context).extension<MyColors>()!;
    return Scaffold(
      appBar: createAppBar("Notes", context),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            color: myColors.errorColour,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
