import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/utils/assets.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/features/onboarding/presentation/mange/onboarding_cubit.dart';
import 'package:well_fit/features/onboarding/presentation/mange/onboarding_state.dart';

class SetLanguageView extends StatelessWidget {
  const SetLanguageView({super.key, required this.cubit, required this.state});

  final OnboardingCubit cubit;
  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: size.height * 0.14,
        start: 25,
        end: 25,
        bottom: 55,
      ),
      child: Column(
        children: [
          SvgPicture.asset(AssetsData.logo1),
          const SizedBox(height: 50),
          const Text(
            "Choose your language",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 40),
          CustomAppButton(
            onTap: () => cubit.chooseLanguage(lang: "ar"),
            height: 80,
            width: 300,
            elevation: 2.5,
            label: "العربية",
            textStyle: TextStyle(
              fontSize: 24,
              letterSpacing: .8,
              fontWeight: FontWeight.w600,
              color: (cubit.language == "en") ? Colors.black : Colors.white,
            ),
            backgroundColor:
                (cubit.language == "en") ? const Color(0xffFFF1ED) : kMainColor,
            icon: SvgPicture.asset(AssetsData.egyptIcon),
          ),
          const SizedBox(height: 30),
          CustomAppButton(
            onTap: () => cubit.chooseLanguage(lang: "en"),
            height: 80,
            width: 300,
            elevation: .8,
            label: "English",
            backgroundColor:
                (cubit.language == "en") ? kMainColor : const Color(0xffFFF1ED),
            textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: (cubit.language == "en") ? Colors.white : Colors.black),
            icon: SvgPicture.asset(AssetsData.usaIcon),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Your language preferences can be\nchanged at any time in settings",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 19,
              color: Color(0xff828894),
              height: 1.6,
            ),
          ),
          // SizedBox(height: size.height * 0.15),
          const Spacer(),
          CustomAppButton(
            label: "Continue",
            onTap: () {
              cubit.onboardingController.nextPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.linear,
              );
            },
          ),
        ],
      ),
    );
  }
}
