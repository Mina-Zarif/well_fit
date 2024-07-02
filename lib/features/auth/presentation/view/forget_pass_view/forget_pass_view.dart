import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/widgets/custom_appbar.dart';
import 'package:well_fit/core/widgets/custom_liner_stepper.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';
import 'package:well_fit/features/auth/presentation/view/forget_pass_view/widgets/enter_email_view.dart';
import 'package:well_fit/features/auth/presentation/view/forget_pass_view/widgets/set_new_password.dart';

import '../signup_view/widgets/verification_view.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          AuthCubit cubit = BlocProvider.of(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CustomAppBar(
                  leadingOnTap: () {
                    if (cubit.forgetIndex != 0) {
                      return cubit.forgetPageController.previousPage(
                        duration: kNavDuration,
                        curve: Curves.linear,
                      );
                    } else {
                      AppRouter.router.pop();
                    }
                  },
                  leading: const Icon(Icons.arrow_back_ios),
                  title: CustomLinerStepper(
                    totalSteps: 2,
                    step: cubit.forgetIndex.toDouble(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 50,
                      start: 15,
                      end: 15,
                    ),
                    child: PageView(
                      controller: cubit.forgetPageController,
                      onPageChanged: (value) => cubit.onForgetPassToggle(value),
                      children: [
                        EnterYourEmailView(
                          cubit: cubit,
                          state: state,
                        ),
                        VerificationView(
                          cubit: cubit,
                          state: state,
                          showSteps: false,
                          onTap: () {
                            cubit.forgetPageController.nextPage(
                              duration: kNavDuration,
                              curve: Curves.linear,
                            );
                          },
                        ),
                        SetNewPassView(
                          cubit: cubit,
                          state: state,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
