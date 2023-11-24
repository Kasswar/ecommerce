import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomSaveDetailsButton extends StatelessWidget {

  final void Function()? onTap;
  const CustomSaveDetailsButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: 250,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient:const LinearGradient(
              colors: [AppColor.primaryColor,AppColor.black]
          ),
        ),
        child: Text("36".tr,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.white,height: 0),),
      ),
    );
  }
}
