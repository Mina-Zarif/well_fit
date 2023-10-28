import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/widgets/custom_appbar.dart';
import 'package:well_fit/core/widgets/custom_liner_stepper.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';
import 'package:well_fit/features/auth/presentation/view/sign_up_view/widgets/email_view.dart';
import 'package:well_fit/features/auth/presentation/view/sign_up_view/widgets/enroll_name_view.dart';
import 'package:well_fit/features/auth/presentation/view/sign_up_view/widgets/gender_view.dart';
import 'package:well_fit/features/auth/presentation/view/sign_up_view/widgets/verification_view.dart';

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
                  leading: (cubit.index != 0)
                      ? const Icon(Icons.arrow_back_ios)
                      : const SizedBox(),
                  leadingOnTap: () {
                    cubit.pageController.previousPage(
                      duration: kNavDuration,
                      curve: Curves.linear,
                    );
                  },
                  title: CustomLinerStepper(
                    totalSteps: 4,
                    step: cubit.index.toDouble(),
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (value) => cubit.onToggle(value),
                    controller: cubit.pageController,
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
                      )
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
