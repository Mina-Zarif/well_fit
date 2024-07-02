import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/utils/assets.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xfffbb5a2),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsData.successBackground),
            alignment: Alignment.bottomRight,
            fit: BoxFit.none,
          ),
        ),
        child: const SuccessBody(),
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        children: [
          Image.asset(AssetsData.successImage),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 27,
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 300,
            child: Text(
              subTitle,
              style: const TextStyle(
                color: Color(0xfffff8f8),
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 1.8,
                wordSpacing: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 100),
          CustomAppButton(
            label: "Get Started!",
            textStyle: const TextStyle(
              color: kMainColor,
              letterSpacing: 0.8,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            onTap: () => AppRouter.router.pushReplacement(AppRouter.homeView),
            backgroundColor: Colors.white,
            elevation: 0,
          )
        ],
      ),
    );
  }

  final String title = "You are ready to go!",
      subTitle =
          "Thanks for taking your time to create account with us. Now this is the fun part, let’s explore the app.";
}
