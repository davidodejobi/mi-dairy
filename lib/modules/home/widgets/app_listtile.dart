import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    required this.iconData,
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPressed,
        title: Row(
          children: [
            Icon(
              iconData,
              size: 25,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: 18,
                  ),
            ),
          ],
        ));
  }
}
