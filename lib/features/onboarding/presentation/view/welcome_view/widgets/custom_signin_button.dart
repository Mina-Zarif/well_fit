import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';

class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({super.key, required this.onSignInTap});

  final Function() onSignInTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have account? ",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff4C5980)),
        ),
        InkWell(
          highlightColor: Colors.transparent,
          onTap: onSignInTap,
          child: const Text(
            "Sign in",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: kMainColor,
              decoration: TextDecoration.underline,
              decorationColor: kMainColor,
            ),
          ),
        )
      ],
    );
  }
}
