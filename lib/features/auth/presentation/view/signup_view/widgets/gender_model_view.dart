// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_fit/constants.dart';
import 'package:well_fit/core/utils/assets.dart';

class GenderModelView extends StatelessWidget {
  const GenderModelView(
      {super.key,
        required this.isSelected,
        required this.title,
        required this.imagePath,
        required this.onTap});

  final bool isSelected;
  final String title, imagePath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          color:
          (isSelected) ? const Color(0xfffd8160) : const Color(0xfff6f6f6),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          image: DecorationImage(
            image: const AssetImage(AssetsData.genderPattern),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                (isSelected) ? const Color(0xfffb3f0d) : Colors.transparent,
                BlendMode.srcIn),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10),
            SvgPicture.asset(
              imagePath,
              color: (isSelected) ? Colors.white : kMainColor,
            ),
            Text(
              title,
              style: TextStyle(
                color: (isSelected) ? Colors.white : kMainColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
