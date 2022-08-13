import 'package:flutter/cupertino.dart';

class AddNoteProvider with ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
}
