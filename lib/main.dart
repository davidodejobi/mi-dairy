import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:notetaking_crud_app/locator.dart';
import 'package:notetaking_crud_app/core/utils/theme.dart';
import 'package:provider/provider.dart';

import 'modules/home/home.dart';
import 'modules/home/providers/note_provider.dart';

void main() {
  timeDilation = 1.0;
  setup();
  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final Color colorSeedLight = const Color(0xFF00296B);
  final Color colorSeedDark = const Color(0xFF6B8BC3);
  final bool material3 = true;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteTheme>(
          create: (_) => NoteTheme(),
        ),
        ChangeNotifierProvider<NoteProvider>(
          create: (_) => NoteProvider(),
        ),
      ],
      child: Consumer<NoteTheme>(
        builder: (context, appTheme, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Note Taking App',
            theme: NoteTheme.light(colorSeedLight, material3),
            darkTheme: NoteTheme.dark(colorSeedDark, material3),
            themeMode: appTheme.currentTheme,
            home: const Home(),
          );
        },
      ),
    );
  }
}
