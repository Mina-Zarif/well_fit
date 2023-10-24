import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/utils/styles.dart';
import 'package:well_fit/core/widgets/custom_appbar.dart';
import 'package:well_fit/features/onboarding/presentation/mange/onboarding_cubit.dart';
import 'package:well_fit/features/onboarding/presentation/mange/onboarding_state.dart';
import 'package:well_fit/features/onboarding/presentation/view/onboarding_view/widgets/custom_onboarding_button.dart';

class CustomOnboardingView extends StatelessWidget {
  const CustomOnboardingView(
      {super.key,
      required this.imagePath,
      required this.cubit,
      required this.state,
      required this.title,
      required this.subTitle});

  final OnboardingCubit cubit;
  final OnboardingState state;
  final String imagePath, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        children: [
          CustomAppBar(
            ///TODO : design appBar  onTap
            action: const Text(
              "Skip",
              style: TextStyle(
                color: kMainColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            actionOnTap: () => AppRouter.router.pushReplacement(AppRouter.welcomeView),
            leading: const Icon(Icons.arrow_back_ios),
            leadingOnTap: () => cubit.onboardingController.previousPage(
              duration: const Duration(milliseconds: 250),
              curve: Curves.linear,
            ),
          ),
          Image.asset(imagePath),
          const SizedBox(height: 25),
          Text(
            title,
            style: Styles.quickSand25,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subTitle,
            style: Styles.quickSand16.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          CustomOnboardingButton(
            index: cubit.onboardingIndex,
            onTap: () {
              if (cubit.onboardingIndex != 3) {
                cubit.onboardingController.nextPage(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              } else {
                AppRouter.router.pushReplacement(AppRouter.welcomeView);
              }
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
