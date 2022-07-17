import 'package:get_it/get_it.dart';

import 'modules/home/providers/note_provider.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<NoteProvider>(NoteProvider());
}
