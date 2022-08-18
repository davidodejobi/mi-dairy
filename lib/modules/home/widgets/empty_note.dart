import 'package:flutter/material.dart';

class EmptyNote extends StatelessWidget {
  const EmptyNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/rafiki.png",
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Create your first note !",
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
