import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/utils/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int loadingProgress = 0;

  @override
  void initState() {
    super.initState();
    startLoadingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: size.height * .4,
          bottom: 25,
        ),
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                AssetsData.splashLogo,
                fit: BoxFit.cover,
                width: 250,
              ),
            ),
            const SizedBox(height: 40),
            DotsIndicator(
              dotsCount: 4,
              mainAxisSize: MainAxisSize.min,
              position: loadingProgress,
              decorator: const DotsDecorator(
                color: Color(0xffFFE6DF),
                activeColor: Color(0xffF15223),
              ),
            ),
            const Spacer(),
            const Text(
              "MADE BY VERTEX",
              style: TextStyle(
                color: Color(0xff141416),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  void startLoadingAnimation() {
    Future.delayed(const Duration(milliseconds: 950), () {
      setState(() {
        if (loadingProgress == 3) {
          navigateToHome();
        } else {
          loadingProgress = (loadingProgress + 1) % 4;
          startLoadingAnimation();
        }
      });
    });
  }

  void navigateToHome() async {
    // String? id = await SecureStorage().readSecureData("id");
    AppRouter.router.pushReplacement(AppRouter.onboarding);
  }
}
