import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CustomPaymentMethod extends StatelessWidget {
  final void Function()? cashFun;
  final void Function()? cardFun;
  final bool isActive;
  const CustomPaymentMethod(
      {super.key,
      required this.cashFun,
      required this.cardFun,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "93".tr,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColor.primaryColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: cashFun,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColor.secondColor
                      : AppColor.thirdColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.black, width: 2),
                ),
                child: Text(
                  "94".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color:
                          isActive ? AppColor.backgroundColor : AppColor.black,
                      height: 0),
                ),
              ),
            ),
            InkWell(
              onTap: cardFun,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: !isActive
                      ? AppColor.secondColor
                      : AppColor.thirdColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.black, width: 2),
                ),
                child: Text(
                  "95".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color:
                          !isActive ? AppColor.backgroundColor : AppColor.black,
                      height: 0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
