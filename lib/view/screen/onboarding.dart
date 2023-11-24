import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/responsive/responsivewidget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customdotcontroller.dart';
import '../widget/onboarding/customslideronboarding.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: ResponsiveWidget(builder: (context,deviceModel){
        return SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const CustomDotControllerOnBoarding(),
                    SizedBox(height:deviceModel.localHeight/26.5,),
                    CustomButtonOnBoarding(
                      width: deviceModel.localWidth*4/5,
                      height: deviceModel.localHeight/18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
