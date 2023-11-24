import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
class CustomButtonAuth extends StatelessWidget {
  final String text;
  final double height;
  final void Function()? onPressed;
  const CustomButtonAuth({Key? key, required this.text,required this.onPressed, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed:onPressed,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: AppColor.primaryColor,
      textColor: AppColor.white,
      child: Text(text.tr),);
  }
}
