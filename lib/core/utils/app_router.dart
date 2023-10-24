import 'package:go_router/go_router.dart';
import 'package:well_fit/core/widgets/custom_animated_transition_page.dart';
import 'package:well_fit/features/onboarding/presentation/view/onboarding_view/onboarding_view.dart';
import 'package:well_fit/features/onboarding/presentation/view/welcome_view/welcome_view.dart';
import 'package:well_fit/features/splash/splash_view.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String welcomeView = '/welcome';

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
    ],
  );
}
