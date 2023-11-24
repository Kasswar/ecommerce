import 'package:flutter/material.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constant/color.dart';
import 'package:get/get.dart';

class CustomPromoBill extends StatelessWidget {
  final int couponDiscount;
  final void Function()? promoFun;
  final void Function()? goToCheckout;
  const CustomPromoBill(
      {super.key,
      required this.couponDiscount,
      required this.promoFun,
      required this.goToCheckout});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return SizedBox(
        height: 200,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColor.grey),
              ),
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: const TextStyle(
                            height: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${controller.subTotalDiscount.toStringAsFixed(2)}\$",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans",
                            color: AppColor.priceColor,
                            height: 0),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColor.primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: goToCheckout,
              child: Container(
                //width: 250,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: AppColor.primaryColor,
                ),
                child: Text(
                  "100".tr,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white,
                      height: 0),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
