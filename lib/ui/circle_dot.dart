import 'package:flutter/material.dart';
import 'package:flutterapp/constants/constants.dart';

class CircleDot extends StatelessWidget {
  final Color? circleColor;
  const CircleDot({
    Key? key,
    this.circleColor = AppColors.redBright,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
