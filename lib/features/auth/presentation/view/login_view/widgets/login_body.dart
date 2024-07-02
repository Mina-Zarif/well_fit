import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/utils/assets.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/core/widgets/custom_appbar.dart';
import 'package:well_fit/core/widgets/custom_text_field.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';
import 'package:well_fit/features/auth/presentation/view/login_view/widgets/custom_forget_password_button.dart';
import 'package:well_fit/features/auth/presentation/view/login_view/widgets/custom_signup_button.dart';
import 'package:well_fit/features/auth/presentation/view/login_view/widgets/social_media_icons.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key, required this.cubit, required this.state});

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          children: [
            CustomAppBar(
              leading: const Icon(Icons.arrow_back_ios),
              leadingOnTap: () => AppRouter.router.pop(),
            ),
            SvgPicture.asset(AssetsData.splashLogo),
            const SizedBox(height: 30),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Email",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: cubit.loginEmailAddress,
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              elevation: 4,
            ),
            const SizedBox(height: 25),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: cubit.loginPassword,
              elevation: 4,
              hintText: "Password",
              isPassword: true,
              textInputType: TextInputType.visiblePassword,
              suffixIconData: (cubit.obscurePassword)
                  ? Icons.visibility
                  : Icons.visibility_off_rounded,
              onSuffixIconTap: () => cubit.getPasswordObscure(),
              obscureText: cubit.obscurePassword,
            ),
            const SizedBox(height: 10),
            CustomForgetPassButton(
              rememberMe: true,
              onChanged: () {},
              onForgetPassButton: () => AppRouter.router.push(AppRouter.forgetPass),
            ),
            const SizedBox(height: 25),
            CustomAppButton(
              label: "Login",
              onTap: () => AppRouter.router.pushReplacement(AppRouter.homeView),
            ),
            const SizedBox(height: 25),
            const Text(
              "or continue with",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 25),
            SocialMediaIcons(
              facebookOnTap: () {},
              googleOnTap: () {},
              twitterOnTap: () {},
            ),
            const SizedBox(height: 30),
            CustomSignupButton(
              onTap: () {
                AppRouter.router.push(AppRouter.signupView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
