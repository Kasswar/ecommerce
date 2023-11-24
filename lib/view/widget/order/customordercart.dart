import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/color.dart';

class CustomOrderCard extends StatelessWidget {
  final int orderNumber;
  final String orderDate;
  final String orderPrice;
  final double deliveryPrice;
  final String orderStatus;
  final int paymentMethod;
  final String totalPrice;
  final void Function()? detailsFun;
  final void Function()? deleteFun;
  const CustomOrderCard({
    super.key,
    required this.orderNumber,
    required this.orderDate,
    required this.orderPrice,
    required this.deliveryPrice,
    required this.paymentMethod,
    required this.orderStatus,
    required this.totalPrice,
    required this.detailsFun,
    required this.deleteFun,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(colors: [
            AppColor.thirdColor,
            AppColor.white,
          ]),
          border: Border.all(
            width: 1.5,
            color: AppColor.black,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${'110'.tr} $orderNumber",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                      height: 0),
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(orderDate).fromNow(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey,
                    height: 0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const Divider(
              thickness: 1.5,
              color: AppColor.secondColor,
            ),
            Text(
              "${'111'.tr} $orderPrice\$",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.grey,
                height: 0,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "${'112'.tr} $deliveryPrice\$",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.grey,
                height: 0,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "${'113'.tr} $orderStatus",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.grey,
                height: 0,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "${'107'.tr} ${paymentMethod == 0 ? "94".tr : "95".tr}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.grey,
                height: 0,
              ),
              textAlign: TextAlign.start,
            ),
            const Divider(
              thickness: 1.5,
              color: AppColor.secondColor,
            ),
            Row(
              children: [
                Text(
                  "${'114'.tr} $totalPrice\$",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondColor,
                    height: 0,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                orderStatus == "116".tr
                    ? IconButton(
                        onPressed: deleteFun,
                        icon: const Icon(
                          Icons.delete,
                          size: 27,
                          color: AppColor.black,
                        ))
                    : const SizedBox(),
                const Spacer(),
                MaterialButton(
                  onPressed: detailsFun,
                  color: AppColor.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "115".tr,
                    style: const TextStyle(
                      color: AppColor.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
