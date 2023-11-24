import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomCheckoutButton extends StatelessWidget {
  final String title;
  final Color color;
  final void Function()? onTap;
  const CustomCheckoutButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: color),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
              height: 0),
        ),
      ),
    );
  }
}
