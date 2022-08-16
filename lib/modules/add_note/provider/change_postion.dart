import 'package:flutter/material.dart';

class ChangePosition with ChangeNotifier {
  Offset offset = Offset.zero;
  void changePositionUp() {
    offset = offset -= const Offset(0, 1);
    notifyListeners();
  }

  void changePositionDown() {
    print('changePositionDown');
    offset = offset -= const Offset(0, -1);
    notifyListeners();
  }
}
