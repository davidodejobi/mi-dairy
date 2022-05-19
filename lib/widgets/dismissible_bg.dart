import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DismissibleBG extends StatelessWidget {
  final MainAxisAlignment? mainAL;
  final String? animations;
  final double? size;
  const DismissibleBG({
    Key? key,
    this.animations,
    this.mainAL,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: mainAL!,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/$animations.json',
              height: size,
              width: size,
              repeat: false,
            ),
          ],
        ),
      ),
    );
  }
}
