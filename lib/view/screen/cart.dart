import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/class/statuesrequest.dart';
import '../widget/cart/customappbar.dart';
import '../widget/cart/customcart.dart';
import '../widget/cart/custompromobill.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
        init: CartControllerImp(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: AppColor.backgroundColor,
            body: Container(
              color: AppColor.backgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomAppBar(),
                  SizedBox(
                    height: controller.statuesRequest == StatuesRequest.fail
                        ? 220
                        : 15,
                  ),
                  HandlingDataView(
                    statuesRequest: controller.statuesRequest,
                    widget: ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.cart.length,
                      itemBuilder: (context, index) {
                        return CustomCart(
                          cartModel: controller.cart[index],
                          index: index,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.statuesRequest == StatuesRequest.fail ||
                          controller.statuesRequest == StatuesRequest.loading
                      ? const SizedBox()
                      : CustomPromoBill(
                          couponDiscount: controller.couponDiscount,
                          promoFun: () async {},
                          goToCheckout: () {
                            controller.goToCheckout();
                          },
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ));
        });
  }
}
