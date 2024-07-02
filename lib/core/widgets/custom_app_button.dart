import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.backgroundColor = kMainColor,
    this.width = 250,
    this.height = 60,
    this.splashColor = const Color(0xffEAEAEA),
    this.textStyle = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.8,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    this.icon,
    this.borderRadius = 18,
    this.elevation = 0,
    this.activeButton = true,
    this.inactiveColor = const Color(0xffFF896A),
  });

  final String label;
  final Function() onTap;
  final Color backgroundColor;
  final double width, height, borderRadius, elevation;
  final Color splashColor, inactiveColor;
  final TextStyle textStyle;
  final Widget? icon;
  final bool activeButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashColor,
      highlightColor: splashColor,
      onTap: (activeButton) ? onTap : null,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Card(
        elevation: elevation,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: (activeButton) ? backgroundColor : inactiveColor,
            borderRadius: BorderRadiusDirectional.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (icon != null) icon!,
              Text(
                label,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
