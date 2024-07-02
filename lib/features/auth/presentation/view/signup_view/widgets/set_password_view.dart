import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/core/widgets/custom_password_checker_view.dart';
import 'package:well_fit/core/widgets/custom_text_field.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({super.key, required this.cubit, required this.state});

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const Text(
            "STEP 5/5",
            style: TextStyle(
              color: kMainColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Set Your Password",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              letterSpacing: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          CustomTextField(
            controller: cubit.signupPassword,
            textInputType: TextInputType.visiblePassword,
            suffixIconData: cubit.obscurePassword
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
            onSuffixIconTap: () => cubit.getPasswordObscure(),
            hintText: "Enter Your Password",
            elevation: 1.4,
            isPassword: true,
            obscureText: cubit.obscurePassword,
            onChanged: (value) => cubit.passwordStrengthChecker(value),
          ),
          const SizedBox(height: 30),
          CustomPasswordCheckerView(
            activeColor: kMainColor,
            inactiveColor: const Color(0xffFFE6DF),
            strengthCriteria: cubit.strengthCriteria,
          ),
          const SizedBox(height: 25),
          CustomAppButton(
            label: "Continue",
            activeButton: cubit.signupConfirmNewPassword,
            backgroundColor:
                cubit.signupConfirmNewPassword ? kMainColor : const Color(0xfffbaf99),
            onTap: () => cubit.signupPageController.nextPage(duration: kNavDuration, curve: Curves.linear),
          ),
        ],
      ),
    );
  }
}

