import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomLinerStepper extends StatelessWidget {
  const CustomLinerStepper({
    super.key,
    this.width = 120,
    required this.percent,
    this.backgroundColor = const Color(0xffD8D8D8),
    this.activeColor = kMainColor,
  });

  final double width, percent;
  final Color backgroundColor, activeColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        Container(
          height: 8,
          width: width * percent,
          decoration: BoxDecoration(
            color: activeColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
