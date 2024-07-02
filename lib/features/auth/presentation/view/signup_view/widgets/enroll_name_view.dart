import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/core/widgets/custom_text_field.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';

class EnrollNameView extends StatelessWidget {
  const EnrollNameView({super.key, required this.cubit, required this.state});

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "STEP 1/5",
              style: TextStyle(
                color: kMainColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Let’s Start With Your\n Full Name",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                letterSpacing: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            CustomTextField(
              controller: cubit.firstName,
              textInputType: TextInputType.name,
              hintText: "First Name",
              elevation: 1.4,
            ),
            const SizedBox(height: 22),
            CustomTextField(
              controller: cubit.lastName,
              textInputType: TextInputType.name,
              hintText: "Last Name",
              elevation: 1.8,
            ),
            const SizedBox(height: 40),
            CustomAppButton(
              label: "Continue",
              onTap: () {
                cubit.signupPageController.nextPage(
                  duration: kNavDuration,
                  curve: Curves.linear,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
