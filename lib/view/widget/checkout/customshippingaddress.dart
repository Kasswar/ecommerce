import 'package:ecommerce/controller/chekout_controller.dart';
import 'package:ecommerce/view/widget/checkout/customaddresscheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CustomShippingAddress extends StatelessWidget {
  const CustomShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutControllerImp>(
        init: CheckoutControllerImp(),
        builder: (controller) {
          return controller.isActiveDelivery == false
              ? Column(
                  children: [
                    Text(
                      "99".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Container(
                      //color: Colors.green,
                      width: double.infinity,
                      height: 260,
                      child: ListView.builder(
                          itemCount: controller.addressModelList.length,
                          itemBuilder: (context, index) {
                            return CustomAddressCheckout(
                              shippingAddressFun: () {
                                controller.shippingAddressFun(controller
                                    .addressModelList[index].addressId
                                    .toString());
                              },
                              addressName: controller
                                  .addressModelList[index].addressName!,
                              addressCity: controller
                                  .addressModelList[index].addressCity!,
                              addressStreet: controller
                                  .addressModelList[index].addressStreet!,
                              isActive: controller.addressId ==
                                      controller
                                          .addressModelList[index].addressId
                                          .toString()
                                  ? true
                                  : false,
                              index: index,
                            );
                          }),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 300,
                );
        });
  }
}
