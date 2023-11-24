import 'package:ecommerce/data/datasourse/remote/forgetpassworddata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statuesrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
  void goToVerifyCodePage();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{
  late TextEditingController email;
  GlobalKey<FormState> key=GlobalKey<FormState>();
  StatuesRequest? statuesRequest;
  List data=[];
  @override
  void onInit() {
    email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  checkEmail() {

  }

  @override
  void goToVerifyCodePage()async{
    var formState=key.currentState;
    if(formState!.validate()){
      ForgetPasswordData verifyCodeSignUpData=ForgetPasswordData(crud: Get.find(),email: email.text);
      statuesRequest=StatuesRequest.loading;
      update();
      var response= await verifyCodeSignUpData.postData();
      print("++++++++++++++++++++++++++++++++++++");
      print(response["statues"]);
      statuesRequest= handlingData(response);
      if(statuesRequest==StatuesRequest.success){
        if(response["statues"]=="success"){
          Get.offNamed(AppRoutes.verifyCode,arguments:{"email":email.text});
        }else{
          statuesRequest=StatuesRequest.fail;
          Get.defaultDialog(
              title: "50".tr,
              content: Text("57".tr)
          );
        }
      }
      update();
      print("valid");
    }else{
      print("not valid");
    }
  }

}