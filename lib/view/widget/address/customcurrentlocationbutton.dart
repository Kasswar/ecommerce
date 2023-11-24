import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomCurrentLocationButton extends StatelessWidget {

  final void Function()? onTap;
  const CustomCurrentLocationButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.black,
        ),
        child: const Icon(Icons.my_location,color: AppColor.white,),
      ),
    );
  }
}
