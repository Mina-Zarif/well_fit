import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit/core/utils/assets.dart';
import 'package:well_fit/features/onboarding/data/text_data.dart';
import 'package:well_fit/features/onboarding/presentation/mange/onboarding_cubit.dart';
import 'package:well_fit/features/onboarding/presentation/mange/onboarding_state.dart';
import 'package:well_fit/features/onboarding/presentation/view/onboarding_view/widgets/custom_onboarding_body.dart';
import 'package:well_fit/features/onboarding/presentation/view/onboarding_view/widgets/set_language_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          OnboardingCubit cubit = BlocProvider.of(context);
          return PageView(
            controller: cubit.onboardingController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) => cubit.onOnboardingChanged(value),
            children: [
              SetLanguageView(cubit: cubit, state: state),
              CustomOnboardingView(
                imagePath: AssetsData.dietPana1,
                cubit: cubit,
                state: state,
                title: onboardingTitles[0],
                subTitle: onboardingSubTitles[0],
              ),
              CustomOnboardingView(
                imagePath: AssetsData.dietPana2,
                cubit: cubit,
                state: state,
                title: onboardingTitles[1],
                subTitle: onboardingSubTitles[1],
              ),
              CustomOnboardingView(
                imagePath: AssetsData.dietPana3,
                cubit: cubit,
                state: state,
                title: onboardingTitles[2],
                subTitle: onboardingSubTitles[2],
              ),
            ],
          );
        },
      ),
    );
  }
}
