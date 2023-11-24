import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class CustomTotalPrice extends StatelessWidget {
  final double orderPrice;
  const CustomTotalPrice({super.key, required this.orderPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 120,
      decoration: BoxDecoration(
        color: AppColor.thirdColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "114".tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.backgroundColor,
            ),
          ),
          Text(
            "${orderPrice.toStringAsFixed(2)}\$",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.backgroundColor,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
