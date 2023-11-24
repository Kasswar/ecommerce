import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomProductsTitle extends StatelessWidget {
  const CustomProductsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "61".tr,
      style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          height: 0,
          color: AppColor.secondColor),
      textAlign: TextAlign.center,
    );
  }
}
