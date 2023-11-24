import 'package:ecommerce/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomPromoCode extends StatelessWidget {
  final TextEditingController? couponController;
  const CustomPromoCode({super.key, required this.couponController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "49".tr;
          }
        },
        controller: couponController,
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          hintText: "91".tr,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
      ),
    );
  }
}
