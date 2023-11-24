import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomAddressDetailsButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomAddressDetailsButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            AppColor.primaryColor,
            AppColor.black
          ]),
        ),
        child: Text(
          "81".tr,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
              height: 0),
        ),
      ),
    );
  }
}
