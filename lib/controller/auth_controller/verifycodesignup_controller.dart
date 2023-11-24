import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuesrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasourse/remote/verifycodesignupdata.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  checkCode(String verifyCode);
  void goToSuccessSignUpPage();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{
  StatuesRequest? statuesRequest;
  late String email;
  List data=[];

  @override
  void onInit() {
    email= Get.arguments["email"];
    print(email);
    super.onInit();
  }

  @override
  checkCode(String verifyCode) async{
    VerifyCodeSignUpData verifyCodeSignUpData=VerifyCodeSignUpData(crud: Get.find(),email: email,verifyCode: verifyCode);
    statuesRequest=StatuesRequest.loading;
    update();
    var response= await verifyCodeSignUpData.postData();
    print("++++++++++++++++++++++++++++++++++++");
    print(response["statues"]);
    statuesRequest= handlingData(response);
    if(statuesRequest==StatuesRequest.success){
      if(response["statues"]=="success"){
        Get.offNamed(AppRoutes.successSignUp);

      }else{
        statuesRequest=StatuesRequest.fail;
        Get.defaultDialog(
            title: "50".tr,
            content: Text("55".tr)
        );
      }
    }
    update();
  }

  @override
  void goToSuccessSignUpPage() {
    Get.offNamed(AppRoutes.successSignUp);
  }

}