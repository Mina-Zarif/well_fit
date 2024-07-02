import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';

class CustomSignupButton extends StatelessWidget {
  const CustomSignupButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t Have an account? ",
          style: TextStyle(
            color: Color(0xff4C5980),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: kMainColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
