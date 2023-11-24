import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: ()=>Get.back(), icon:const Icon(Icons.arrow_back),padding: EdgeInsets.zero,),
        const SizedBox(width: 105,),
        Text("Cart",style: Theme.of(context).textTheme.headline2!.copyWith(height: 0),),
      ],
    );
  }
}
