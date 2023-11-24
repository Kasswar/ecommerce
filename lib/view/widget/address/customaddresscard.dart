import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomAddressCard extends StatelessWidget {
  final String dismissKey;
  final void Function(DismissDirection)? onDismissed;
  final String addressName;
  final String addressCity;
  final String addressStreet;
  const CustomAddressCard({super.key, required this.dismissKey,required this.onDismissed, required this.addressName, required this.addressCity, required this.addressStreet});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(dismissKey),
      onDismissed: onDismissed,
      background:Container(
        padding:const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.centerLeft,
        child:const Icon(Icons.delete,),),
      secondaryBackground:Container(
        padding:const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.centerRight,
        child:const Icon(Icons.delete,),),
      child: Card(
        child: ListTile(
          title: Text(addressName,style:const TextStyle(color: AppColor.black,fontWeight: FontWeight.bold),),
          subtitle:RichText(
            text: TextSpan(
                children:[
                  TextSpan(text:"${"82".tr}:",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),
                  TextSpan(text:addressCity,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.grey)),
                  const TextSpan(text:"   ",),
                  TextSpan(text:"${"83".tr}:",style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),
                  TextSpan(text:addressStreet,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.grey)),
                ]
            ),
          ),
          //Text("City:${controller.addressModelList[index].addressCity}-Street:${controller.addressModelList[index].addressStreet}"),
        ),
      ),
    );
  }
}
