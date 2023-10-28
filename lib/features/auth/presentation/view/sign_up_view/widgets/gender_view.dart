import 'package:flutter/material.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/utils/assets.dart';
import 'package:well_fit/core/widgets/custom_app_button.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_cubit.dart';
import 'package:well_fit/features/auth/presentation/mange/auth_state.dart';
import 'package:well_fit/features/auth/presentation/view/sign_up_view/widgets/gender_model_view.dart';

class GenderView extends StatelessWidget {
  const GenderView({super.key, required this.cubit, required this.state});

  final AuthCubit cubit;
  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const Text(
            "STEP 2/5",
            style: TextStyle(
              color: kMainColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Choose Your Gender",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GenderModelView(
                isSelected: cubit.isMale,
                title: "Male",
                onTap: () => cubit.chooseGender(true),
                imagePath: AssetsData.maleIcon,
              ),
              GenderModelView(
                isSelected: !cubit.isMale,
                title: "Female",
                onTap: () => cubit.chooseGender(false),
                imagePath: AssetsData.femaleIcon,
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            "To give you a customize experience\n we need to know your gender",
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.7,
                letterSpacing: 0.9,
                wordSpacing: 0.9,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff4C5980)),
          ),
          const SizedBox(height: 60),
          CustomAppButton(
            label: "Continue",
            onTap: () => cubit.pageController.nextPage(duration: kNavDuration, curve: Curves.linear)
            ,
          )
        ],
      ),
    );
  }
}
