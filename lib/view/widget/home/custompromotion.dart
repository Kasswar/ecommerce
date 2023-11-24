import 'package:ecommerce/controller/homecontroller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
class CustomPromotion extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomPromotion({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient:const LinearGradient(
          colors: [AppColor.primaryColor,AppColor.black]
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: ListTile(
            title: Text(
              title,
              style:const TextStyle(
                  color: AppColor.white, fontSize: 16),
            ),
            subtitle: Text(
              body,
              style:const TextStyle(
                  color: AppColor.white,
                  fontSize: 24,
                  height: 0),
            ),
          ),
        ),
      ]),
    );
  }
}
