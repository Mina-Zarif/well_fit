import 'package:flutter/material.dart';
import 'package:well_fit/features/onboarding/presentation/view/welcome_view/widgets/welcome_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeBody(),
    );
  }
}
