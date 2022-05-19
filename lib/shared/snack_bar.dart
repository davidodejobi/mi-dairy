import 'package:flutter/material.dart';

showSnackBar({
  BuildContext? context,
  VoidCallback? onPressed,
  String? text,
  Color? bgColor,
  Color? textColor,
}) {
  ScaffoldMessenger.of(context!).hideCurrentSnackBar();
  final snackBar = SnackBar(
    backgroundColor: bgColor,
    content: Text(
      "Deleted",
      style: Theme.of(context).textTheme.bodyText1,
    ),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: 'Undo',
      textColor: textColor,
      onPressed: onPressed!,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
