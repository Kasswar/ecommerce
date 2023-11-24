// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/controller/chekout_controller.dart';
import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/view/widget/checkout/custompromocode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/checkout/customcheckoutbutton.dart';
import '../widget/checkout/customdeliverytype.dart';
import '../widget/checkout/custompaymentmethod.dart';
import '../widget/checkout/customshippingaddress.dart';
import '../widget/checkout/orderdetails.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutControllerImp>(
      init: CheckoutControllerImp(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.backgroundColor,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: AppColor.black,
              ),
              title: const Text(
                "Checkout",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColor.black,
                    height: 1.4),
              ),
              centerTitle: true,
              backgroundColor: AppColor.backgroundColor,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: ListView(
                children: [
                  CustomPromoCode(
                    couponController: controller.couponController!,
                  ),
                  CustomPaymentMethod(
                    cashFun: () {
                      controller.paymentMethodFun("0", true);
                    },
                    cardFun: () {
                      controller.paymentMethodFun("1", false);
                    },
                    isActive: controller.isActivePayment,
                  ),
                  CustomDeliveryType(
                    carThruFun: () {
                      controller.deliveryTypeFun("1", true);
                    },
                    deliveryFun: () {
                      controller.deliveryTypeFun("0", false);
                    },
                    isActive: controller.isActiveDelivery,
                  ),
                  const CustomShippingAddress(),
                  CustomCheckoutButton(
                    title: "101".tr,
                    color: AppColor.black,
                    onTap: () async {
                      if (controller.couponController!.text.isEmpty) {
                        //await controller.addOrder("20.12",controller.subTotalDiscount.toString(), controller.subTotalDiscount.toString());
                        controller.couponModel = null;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "Order Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              actions: [
                                CustomCheckoutButton(
                                  title: "102".tr,
                                  color: AppColor.secondColor,
                                  onTap: () async {
                                    await controller.addOrder(
                                        "20.12",
                                        controller.subTotalDiscount.toString(),
                                        controller.subTotalDiscount.toString());
                                  },
                                )
                              ],
                              content: const OrderDetails(),
                            );
                          },
                        );
                      } else {
                        await controller.checkCoupon(
                            controller.couponController!.text.toString());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
