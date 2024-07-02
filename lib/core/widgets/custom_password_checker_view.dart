import 'package:flutter/material.dart';

class CustomPasswordCheckerView extends StatelessWidget {
  const CustomPasswordCheckerView({
    super.key,
    required this.activeColor,
    required this.inactiveColor,
    required this.strengthCriteria,
  });

  final Color activeColor, inactiveColor;
  final List<bool> strengthCriteria;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: (strengthCriteria[1]) ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(25),
              ),
              width: 70,
              height: 7,
            ),
            Container(
              decoration: BoxDecoration(
                color: (strengthCriteria[2]) ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(25),
              ),
              width: 70,
              height: 7,
            ),
            Container(
              decoration: BoxDecoration(
                color: (strengthCriteria[3]) ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(25),
              ),
              width: 70,
              height: 7,
            ),
            Container(
              decoration: BoxDecoration(
                color: (strengthCriteria[4]) ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(25),
              ),
              width: 70,
              height: 7,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "• 1 lowercase\n• 1 uppercase",
                style: TextStyle(
                  color: Color(0xff4C5980),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.7,
                ),
              ),
              Text(
                "• 1 symbols\n• 1 number",
                style: TextStyle(
                  color: Color(0xff4C5980),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.7,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
