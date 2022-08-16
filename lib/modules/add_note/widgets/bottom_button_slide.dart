import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/change_postion.dart';

class BottomButtonSlide extends StatelessWidget {
  const BottomButtonSlide({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    ChangePosition position = Provider.of<ChangePosition>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSlide(
          offset: position.offset,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.slowMiddle,
          child: Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              color: color!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                position.changePositionDown();
              },
              child: const Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        AnimatedSlide(
          offset: position.offset,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.slowMiddle,
          child: SizedBox(
            // padding: const EdgeInsets.all(.0),
            height: 70,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: color!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_box_outlined,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text("Add Todo",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.notification_add_outlined,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text("Reminder",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                // Expanded(
                //   child: Row(
                //     children: [
                //       Container(
                //         height: 100,
                //         width: double.infinity,
                //         decoration: BoxDecoration(
                //           color: const Color(0xFF17191D),
                //           borderRadius: BorderRadius.circular(
                //             5,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         height: 100,
                //         width: double.infinity,
                //         decoration: BoxDecoration(
                //           color: const Color(0xFF17191D),
                //           borderRadius: BorderRadius.circular(
                //             5,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
