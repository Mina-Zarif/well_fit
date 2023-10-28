import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/core/widgets/custom_text_field.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';

class EmailView extends StatelessWidget {
  const EmailView({super.key, required this.cubit, required this.state});

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
              "STEP 3/5",
              style: TextStyle(
                color: kMainColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              " What’s Your\nEmail Address",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                letterSpacing: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              "Email We Can Use To Reach You",
              style: TextStyle(color: Color(0xff9F9F9F)),
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: cubit.emailAddress,
              textInputType: TextInputType.emailAddress,
              hintText: "Email",
              elevation: 1.4,
            ),
            const SizedBox(height: 50),
            CustomAppButton(
              label: "Verify",
              onTap: () {
                cubit.pageController.nextPage(
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
