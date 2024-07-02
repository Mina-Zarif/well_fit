import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_fit/core/utils/assets.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons(
      {super.key,
        required this.facebookOnTap,
        required this.twitterOnTap,
        required this.googleOnTap});

  final Function() facebookOnTap, twitterOnTap, googleOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: googleOnTap,
          child: SvgPicture.asset(AssetsData.googleIcon),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: facebookOnTap,
          child: SvgPicture.asset(AssetsData.facebookIcon),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: twitterOnTap,
          child: SvgPicture.asset(AssetsData.twitterIcon),
        ),
      ],
    );
  }
}
