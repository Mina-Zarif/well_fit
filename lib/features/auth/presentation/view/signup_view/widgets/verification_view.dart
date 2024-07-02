import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/core/widgets/custom_pin_code_fields.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({
    super.key,
    required this.cubit,
    required this.state,
    this.showSteps = true,
    required this.onTap,
  });

  final AuthCubit cubit;
  final AuthState state;
  final bool showSteps;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Visibility(
            visible: showSteps,
            child: const Text(
              "STEP 4/5",
              style: TextStyle(
                color: kMainColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Verify Your Email",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              letterSpacing: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "We’ll send the code on vertex@gmail.com",
            style: TextStyle(color: Color(0xff9F9F9F)),
          ),
          const SizedBox(height: 50),
          CustomVerificationCode(
            onChange: (value) => cubit.pinCode = value,
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {},
            child: const Text(
              "Send Me a New Code",
              style: TextStyle(
                color: kMainColor,
                decoration: TextDecoration.underline,
                decorationColor: kMainColor,
              ),
            ),
          ),
          const SizedBox(height: 25),
          CustomAppButton(
            label: "Continue",
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
