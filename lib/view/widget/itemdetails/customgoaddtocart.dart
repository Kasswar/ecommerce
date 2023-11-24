import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomGoAddToCart extends StatelessWidget {
  final void Function()? goToCart;
  final void Function()? addToCart;
  const CustomGoAddToCart({super.key,required this.goToCart,required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: goToCart,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.black,
            ),
            child: const Icon(Icons.shopping_basket_outlined,color: AppColor.white,),
          ),
        ),
        InkWell(
          onTap: addToCart,
          child: Container(
            width: 250,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient:const LinearGradient(
                  colors: [AppColor.primaryColor,AppColor.black]
              ),
            ),
            child: Text("62".tr,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.white,height: 0),),
          ),
        ),
      ],
    );
  }
}
