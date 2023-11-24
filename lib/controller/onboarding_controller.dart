import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/datasourse/static/static.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController{
  int currentPage=0;
  late PageController pageController;
  MyServices myServices=Get.find();
  @override
  next() {
    currentPage++;
    if(currentPage==onBoardingList.length){
      myServices.sharedPreferences.setString("step","1");
      Get.offAllNamed(AppRoutes.login);
    }
    else{
      pageController.animateToPage(currentPage, duration:const Duration(milliseconds: 900),curve: Curves.easeInOut);
      update();
    }
  }

  @override
  onPageChanged(int index) {
    currentPage=index;
    update();
  }

  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }
}