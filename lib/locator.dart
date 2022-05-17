import 'package:get_it/get_it.dart';

import 'models/theme.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<NoteTheme>(() => NoteTheme());
}
