import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:well_fit/features/onboarding/presentation/mange/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  String language = 'en';
  int onboardingIndex = 0;
  PageController onboardingController = PageController();

  void onOnboardingChanged(int index) {
    onboardingIndex = index;
    emit(OnPageChangedState());
  }

  void chooseLanguage({required String lang}) {
    language = lang;
    emit(SetLangState());
  }
}
