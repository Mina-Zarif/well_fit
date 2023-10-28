import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/onboarding/presentation/mange/onboarding_cubit.dart';

import 'core/utils/app_router.dart';

void main() {
  runApp(const WellFit());
}

class WellFit extends StatelessWidget {
  const WellFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.light(useMaterial3: true),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
