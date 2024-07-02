import 'package:go_router/go_router.dart';
import 'package:well_fit/core/widgets/custom_animated_transition_page.dart';
import 'package:well_fit/features/auth/presentation/view/forget_pass_view/forget_pass_view.dart';
import 'package:well_fit/features/auth/presentation/view/login_view/login_view.dart';
import 'package:well_fit/features/auth/presentation/view/signup_view/sign_up_view.dart';
import 'package:well_fit/features/auth/presentation/view/success_view/success_view.dart';
import 'package:well_fit/features/home/presentation/view/home_view/home_view.dart';
import 'package:well_fit/features/onboarding/presentation/view/onboarding_view/onboarding_view.dart';
import 'package:well_fit/features/onboarding/presentation/view/welcome_view/welcome_view.dart';
import 'package:well_fit/features/splash/splash_view.dart';

abstract class AppRouter {
  static const String splash = '/'; // first root
  static const String onboarding = '/onboarding';
  static const String welcomeView = '/welcome';
  static const String signupView = '/sign';
  static const String loginView = '/login';
  static const String homeView = '/home';
  static const String successView = '/success';
  static const String forgetPass = '/forget';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onboarding,
        pageBuilder: (context, state) => buildPageWithFadeTransition(
          context: context,
          state: state,
          child: const OnboardingView(),
        ),
      ),
      GoRoute(
        path: welcomeView,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const WelcomeView(),
        ),
      ),
      GoRoute(
        path: signupView,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: loginView,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: forgetPass,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const ForgetPassView(),
        ),
      ),
      GoRoute(
        path: successView,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const SuccessView(),
        ),
      ),
      GoRoute(
        path: homeView,
        pageBuilder: (context, state) => buildPageWithSlideTransition(
          context: context,
          state: state,
          child: const HomeView(),
        ),
      ),
    ],
  );
}
