import 'package:ecommerce/data/datasourse/remote/signupdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statuesrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';


abstract class SignUpController extends GetxController{
  signUp();
  goToSignInPage();
}

class SignUpControllerImp extends SignUpController{
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phoneNumber;
  GlobalKey<FormState> key=GlobalKey<FormState>();
  StatuesRequest? statuesRequest;
  List data=[];

  @override
  goToSignInPage(){
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    email=TextEditingController();
    password=TextEditingController();
    username=TextEditingController();
    phoneNumber=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  signUp() async{
    var formState=key.currentState;
    if(formState!.validate()){
      SignUpData signUpData=SignUpData(crud: Get.find(), name:username.text,email: email.text,password: password.text, phone:phoneNumber.text);
      statuesRequest=StatuesRequest.loading;
      update();
      var response= await signUpData.postData();
      statuesRequest= handlingData(response);
      if(statuesRequest==StatuesRequest.success){
        if(response["statues"]=="success"){
          data.addAll(response["data"]);
          Get.offNamed(AppRoutes.verifyCodeEmail,arguments: {"email":email.text});

        }else{
          statuesRequest=StatuesRequest.fail;
          Get.defaultDialog(
            title: "50".tr,
            content: Text("54".tr),
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