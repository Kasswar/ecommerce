import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomCategoriesTitle extends StatelessWidget {
  const CustomCategoriesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "60".tr,
      style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          height: 0,
          color: AppColor.secondColor),
      textAlign: TextAlign.center,
    );
  }
}
