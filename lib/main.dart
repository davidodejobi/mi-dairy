import 'package:flutter/material.dart';
import 'package:notetaking_crud_app/locator.dart';
import 'package:notetaking_crud_app/models/theme.dart';
import 'package:provider/provider.dart';

import 'views/home.dart';

void main() {
  setup();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  NoteTheme noteTheme = getIt<NoteTheme>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteTheme>(
          create: (_) => noteTheme,
        ),
      ],
      child: Consumer(
        builder: (context, NoteTheme noteTheme, _) {
          return MaterialApp(
            title: 'Note Taking App',
            theme:
                noteTheme.isDark ? noteTheme.darkTheme : noteTheme.lightTheme,
            darkTheme: noteTheme.darkTheme,
            themeMode: ThemeMode.system,
            home: const Home(),
          );
        },
      ),
    );
  }
}
