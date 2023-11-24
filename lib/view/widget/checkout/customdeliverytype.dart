import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class CustomDeliveryType extends StatelessWidget {
  final void Function()? carThruFun;
  final void Function()? deliveryFun;
  final bool isActive;
  const CustomDeliveryType(
      {super.key,
      required this.carThruFun,
      required this.deliveryFun,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "96".tr,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColor.primaryColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: carThruFun,
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      color: isActive
                          ? AppColor.secondColor
                          : AppColor.thirdColor.withOpacity(0.5),
                    ),
                    child: Image.asset(
                      AppImageAsset.carThru,
                      color: !isActive ? AppColor.black : AppColor.white,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Text(
                  "97".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColor.black,
                      height: 0),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: deliveryFun,
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      color: !isActive
                          ? AppColor.secondColor
                          : AppColor.thirdColor.withOpacity(0.5),
                    ),
                    child: Image.asset(
                      AppImageAsset.delivery,
                      color: !isActive ? AppColor.white : AppColor.black,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Text(
                  "98".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColor.black,
                      height: 0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
