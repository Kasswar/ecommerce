import 'package:ecommerce/core/responsive/responsivewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  final double minWidth;
  final double height;

  const CustomButtonLang(
      {required this.textButton, required this.onPressed, Key? key, required this.minWidth, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (context, deviceModel) {
        return MaterialButton(
          onPressed: onPressed,
          color: AppColor.primaryColor,
          minWidth: minWidth,
          height: height,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            textButton,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        );
      },
    );
  }
}
