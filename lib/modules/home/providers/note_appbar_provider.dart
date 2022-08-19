import 'package:flutter/widgets.dart';

class NoteAppbarProvider with ChangeNotifier {
  bool _isGrid = false;

  bool get isGrid => _isGrid;

  toggleGrid() {
    _isGrid = !_isGrid;
    notifyListeners();
  }
}
