import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/utils/assets.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/core/widgets/custom_appbar.dart';
import 'package:well_fit/features/onboarding/presentation/view/welcome_view/widgets/custom_signin_button.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        children: [
          CustomAppBar(
            action: SvgPicture.asset(AssetsData.moonStartsIcon),
            actionOnTap: () {},
          ),
          const Text(
            "Welcome to ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              height: 1.8,
            ),
          ),
          SvgPicture.asset(AssetsData.logo2),
          const SizedBox(height: 20),
          const Text(
            "now Healthy life became easier!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff4C5980),
            ),
          ),
          const SizedBox(height: 35),
          Expanded(child: Image.asset(AssetsData.welcomePana)),
          const SizedBox(height: 35),
          CustomAppButton(
            label: "Get Started",
            onTap: () => AppRouter.router.pushReplacement(AppRouter.signupView),
          ),
          const SizedBox(height: 20),
          CustomSignInButton(
            onSignInTap: () {},
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
