import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/core/widgets/custom_password_checker_view.dart';
import 'package:well_fit/core/widgets/custom_text_field.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';

class SetNewPassView extends StatelessWidget {
  const SetNewPassView({super.key, required this.cubit, required this.state});

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Enter New Password",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: cubit.setNewPassword,
            hintText: "Enter New Password",
            textInputType: TextInputType.visiblePassword,
            obscureText: cubit.obscurePassword,
            onSuffixIconTap: () => cubit.getPasswordObscure(),
            onChanged: (value) => cubit.newPasswordStrengthChecker(value),
            isPassword: true,
            suffixIconData: cubit.obscurePassword
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            elevation: 2.5,
          ),
          const SizedBox(height: 20),
          CustomPasswordCheckerView(
            activeColor: kMainColor,
            inactiveColor: const Color(0xffFFE6DF),
            strengthCriteria: cubit.strengthCriteriaNewPass,
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Confirm Password",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: cubit.confirmNewPassword,
            hintText: "Confirm Password",
            textInputType: TextInputType.visiblePassword,
            obscureText: cubit.obscureConfirmPassword,
            onSuffixIconTap: () => cubit.getConfirmPasswordObscure(),
            isPassword: true,
            suffixIconData: cubit.obscureConfirmPassword
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            elevation: 2.5,
          ),
          const SizedBox(height: 50),
          CustomAppButton(
            label: "Confirm",
            onTap: () {
              // Conditions = cubit.setNewPassword.text == cubit.confirmNewPassword.text
              AppRouter.router.pushReplacement(AppRouter.homeView);
            },
          ),
        ],
      ),
    );
  }
}
