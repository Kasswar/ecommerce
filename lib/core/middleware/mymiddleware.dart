import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/sevices.dart';

class MyMiddleware extends GetMiddleware{
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route){
    MyServices myServices=Get.find();
    if(myServices.sharedPreferences.getString("step")=="2"){
      return const RouteSettings(name: AppRoutes.homeScreen);
    }
    if(myServices.sharedPreferences.getString("step")=="1"){
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}