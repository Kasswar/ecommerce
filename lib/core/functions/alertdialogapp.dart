import 'dart:io';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:get/get.dart';
Future<bool> alertExitDialog(){
  Get.defaultDialog(
    title:"50".tr,
    middleText: "51".tr,
      confirm: CustomButtonAuth(
        height: 40,
        text:"52".tr, onPressed: (){
    exit(0);
  },),
    cancel:CustomButtonAuth(
      height: 40,
        text:"53".tr, onPressed: (){
      Get.back();
    }),
  );
  return Future.value(true);
}

Future<bool> alertLogoutDialog(void Function()? logoutFun){
  Get.defaultDialog(
    title:"70".tr,
    middleText: "71".tr,
    confirm: CustomButtonAuth(
      height: 40,
      text:"52".tr, onPressed: logoutFun,),
    cancel:CustomButtonAuth(
        height: 40,
        text:"53".tr, onPressed: (){
      Get.back();
    }),
  );
  return Future.value(true);
}