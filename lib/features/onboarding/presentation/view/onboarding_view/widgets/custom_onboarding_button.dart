import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:well_fit/constants.dart';

class CustomOnboardingButton extends StatelessWidget {
  const CustomOnboardingButton({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(60),
      child: CircularPercentIndicator(
        radius: 47,
        lineWidth: 2.6,
        percent: 1 / (4 - index),
        backgroundColor: const Color(0xffeaeaea),
        center: CircleAvatar(
          radius: 35,
          backgroundColor: kMainColor,
          child: (index != 3)
              ? const Icon(Icons.arrow_forward_ios_sharp, color: Colors.white)
              : const Text(
                  "Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
        ),
        progressColor: kMainColor,
      ),
    );
  }
}
