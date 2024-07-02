import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:well_fit/core/functions/password_length_checker.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  PageController signupPageController = PageController(),
      forgetPageController = PageController();
  int signupIndex = 0, forgetIndex = 0;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController signupEmailAddress = TextEditingController();
  TextEditingController loginEmailAddress = TextEditingController();
  TextEditingController signupPassword = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController setNewPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  String pinCode = "";

  bool isMale = true;
  bool obscurePassword = true,
      obscureConfirmPassword = true,
      signupConfirmNewPassword = false,
      forgetPassConfirmNewPass = false;

  List<bool> strengthCriteria = [false, false, false, false, false];
  List<bool> strengthCriteriaNewPass = [false, false, false, false, false];

  void chooseGender(bool gender) {
    isMale = gender;
    emit(AuthSetState());
  }

  void onSignupToggle(int value) {
    signupIndex = value;
    emit(AuthSetState());
  }

  void onForgetPassToggle(int value) {
    forgetIndex = value;
    emit(AuthSetState());
  }

  void getPasswordObscure() {
    obscurePassword = !obscurePassword;
    emit(AuthSetState());
  }

  void getConfirmPasswordObscure() {
    obscureConfirmPassword = !obscureConfirmPassword;
    emit(AuthSetState());
  }

  void passwordStrengthChecker(dynamic value) {
    strengthCriteria = checkPasswordStrength(value);
    signupConfirmNewPassword = strengthCriteria[0] &&
        strengthCriteria[1] &&
        strengthCriteria[2] &&
        strengthCriteria[3] &&
        strengthCriteria[4];

    emit(AuthSetState());
  }

  void newPasswordStrengthChecker(dynamic value) {
    strengthCriteriaNewPass = checkPasswordStrength(value);
    forgetPassConfirmNewPass = strengthCriteriaNewPass[0] &&
        strengthCriteriaNewPass[1] &&
        strengthCriteriaNewPass[2] &&
        strengthCriteriaNewPass[3] &&
        strengthCriteriaNewPass[4];

    emit(AuthSetState());
  }
}
