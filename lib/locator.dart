import 'package:get_it/get_it.dart';
import 'package:notetaking_crud_app/modules/add_note/provider/provider.dart';

import 'modules/home/providers/note_provider.dart';

final getIt = GetIt.I;

void setup() {
  getIt.registerLazySingleton<NoteProvider>(() => NoteProvider());
  getIt.registerLazySingleton<AddNoteProvider>(() => AddNoteProvider());
}
