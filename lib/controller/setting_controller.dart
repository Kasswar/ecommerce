import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/alertdialogapp.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SettingController extends GetxController {}

class SettingControllerImp extends SettingController {
  List<String> titlesList = [
    "66".tr,
    "67".tr,
    "68".tr,
    "69".tr,
    "70".tr,
  ];
  List<IconData> iconList = [
    Icons.notifications_active,
    Icons.my_location,
    Icons.help_center_outlined,
    Icons.phone_callback_outlined,
    Icons.logout,
  ];
  List<void Function()?> functionList = [
    () {},
    () {
      Get.toNamed(AppRoutes.addressView);
    },
    () {},
    () {
      launchUrl(Uri.parse("tel:+963988046261"));
    },
    () {
      alertLogoutDialog(() {
        MyServices myServices = Get.find();
        String id = myServices.sharedPreferences.getString("userId")!;
        FirebaseMessaging.instance.unsubscribeFromTopic("users");
        FirebaseMessaging.instance.unsubscribeFromTopic("users$id");
        myServices.sharedPreferences.clear();
        Get.offAllNamed(AppRoutes.login);
      });
    }
  ];
}
