import 'package:ecommerce/core/responsive/responsivewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  final double width;
  final double height;
  const CustomButtonOnBoarding({required this.width, required this.height,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder:(context,deviceModel){
      return Container(
        width: width,
        height: height,
        margin:const EdgeInsets.only(bottom: 40),
        child: MaterialButton(onPressed:(){
          controller.next();
        },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: AppColor.primaryColor,
          textColor: AppColor.white,
          child: Text("18".tr),),
      );
    });
  }
}
