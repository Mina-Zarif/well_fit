import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/widgets/custom_appbar.dart';
import 'package:well_fit/core/widgets/custom_liner_stepper.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';
import 'package:well_fit/features/auth/presentation/view/signup_view/widgets/email_view.dart';
import 'package:well_fit/features/auth/presentation/view/signup_view/widgets/enroll_name_view.dart';
import 'package:well_fit/features/auth/presentation/view/signup_view/widgets/gender_view.dart';
import 'package:well_fit/features/auth/presentation/view/signup_view/widgets/notification_allow_veiw.dart';
import 'package:well_fit/features/auth/presentation/view/signup_view/widgets/set_password_view.dart';
import 'package:well_fit/features/auth/presentation/view/signup_view/widgets/verification_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            AuthCubit cubit = BlocProvider.of(context);
            return Column(
              children: [
                CustomAppBar(
                  leading: const Icon(Icons.arrow_back_ios),
                  leadingOnTap: () {
                    if (cubit.signupIndex != 0) {
                      cubit.signupPageController.previousPage(
                        duration: kNavDuration,
                        curve: Curves.linear,
                      );
                    } else {
                      AppRouter.router.pop();
                    }
                  },
                  title: CustomLinerStepper(
                    totalSteps: 4,
                    step: cubit.signupIndex.toDouble(),
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (value) => cubit.onSignupToggle(value),
                    controller: cubit.signupPageController,
                    children: [
                      EnrollNameView(
                        cubit: cubit,
                        state: state,
                      ),
                      GenderView(
                        cubit: cubit,
                        state: state,
                      ),
                      EmailView(
                        cubit: cubit,
                        state: state,
                      ),
                      VerificationView(
                        cubit: cubit,
                        state: state,
                        onTap: () {
                          cubit.signupPageController.nextPage(
                            duration: kNavDuration,
                            curve: Curves.linear,
                          );
                        },
                      ),
                      SetPasswordView(
                        cubit: cubit,
                        state: state,
                      ),
                      NotificationAllowVeiw(
                        cubit: cubit,
                        state: state,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
