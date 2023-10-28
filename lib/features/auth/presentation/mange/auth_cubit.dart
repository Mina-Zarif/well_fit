import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  PageController pageController = PageController();
  int index = 0;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  String pinCode = "";

  bool isMale = true;

  void chooseGender(bool gender) {
    isMale = gender;
    emit(AuthSetState());
  }

  void onToggle(int value) {
    index = value;
    emit(AuthSetState());
  }
}
