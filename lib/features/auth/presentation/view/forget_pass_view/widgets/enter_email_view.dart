import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/core/widgets/custom_text_field.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';
import 'package:well_fit/features/auth/presentation/view/login_view/widgets/custom_signup_button.dart';

import '../../login_view/widgets/social_media_icons.dart';

class EnterYourEmailView extends StatelessWidget {
  const EnterYourEmailView(
      {super.key, required this.cubit, required this.state});

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Enter Your Email Address",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "example@gmail.com",
            textInputType: TextInputType.emailAddress,
            elevation: 2.5,
          ),
          const SizedBox(height: 50),
          CustomAppButton(
            label: "Send Verification",
            onTap: () {
              cubit.forgetPageController.nextPage(
                duration: kNavDuration,
                curve: Curves.linear,
              );
            },
          ),
          const SizedBox(height: 25),
          const Text(
            "or",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 25),
          SocialMediaIcons(
            facebookOnTap: () {},
            googleOnTap: () {},
            twitterOnTap: () {},
          ),
          const SizedBox(height: 30),
          CustomSignupButton(
            onTap: () {
              AppRouter.router.push(AppRouter.signupView);
            },
          ),
        ],
      ),
    );
  }
}
