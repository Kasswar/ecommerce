import 'package:ecommerce/controller/chekout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends GetView<CheckoutControllerImp> {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${"103".tr} ${controller.subTotalDiscount.toStringAsFixed(2)}\$",
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "sans",
            ),
          ),
          Text(
            "${"104".tr} ${controller.couponModel == null ? "104".tr : controller.couponModel!.couponName}",
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "sans",
            ),
          ),
          Text(
            "${"105".tr} ${controller.couponModel == null ? '0' : controller.couponModel!.couponDiscount}%",
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "sans",
            ),
          ),
          Text(
            "${"106".tr} ${controller.couponModel == null ? '0' : controller.priceWithCoupon.toStringAsFixed(2)}\$",
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "sans",
            ),
          ),
          Text(
            "${"107".tr} ${controller.paymentMethod == '0' ? '94'.tr : '95'.tr}",
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "sans",
            ),
          ),
          Text(
            "${"108".tr} ${controller.deliveryType == '0' ? '98'.tr : '97'.tr}",
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "sans",
            ),
          ),
        ],
      ),
    );
  }
}
