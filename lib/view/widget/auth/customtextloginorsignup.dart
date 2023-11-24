import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomTextLoginOrSignUp extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function() onTap;
  const CustomTextLoginOrSignUp({Key? key, required this.textOne, required this.textTwo, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne.tr),
        InkWell(onTap: onTap,child: Text(textTwo.tr,style:const TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),),
      ],);
  }
}
