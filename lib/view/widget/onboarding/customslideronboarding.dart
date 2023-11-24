import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/responsive/responsivewidget.dart';
import '../../../data/datasourse/static/static.dart';
class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged:(value){
        controller.onPageChanged(value);
      },
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return ResponsiveWidget(
          builder:(context,deviceModel){
            return Column(
              children: [
                Image.asset(
                  "${onBoardingList[index].image}",
                  width: double.infinity,
                  height: deviceModel.localHeight/1.65,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: deviceModel.localHeight/20,
                ),
                Text(
                  "${onBoardingList[index].title}",
                  style:const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.black),
                ),
                SizedBox(
                  height: deviceModel.localHeight/40,
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${onBoardingList[index].body}",
                      style:const TextStyle(
                          height: 2,
                          color: AppColor.grey,
                          fontSize: 17),
                      textAlign: TextAlign.center,
                    )),
              ],
            );
          }
        );
      },
    );
  }
}
