import 'package:ecommerce/data/datasourse/remote/resetpassworddata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statuesrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  void goToSuccessResetPassword();
  }

class ResetPasswordControllerImp extends ResetPasswordController{
  late TextEditingController password;
  late TextEditingController rePassword;
  StatuesRequest? statuesRequest;
  late String email;
  List data=[];

  @override
  void onInit() {
    password=TextEditingController();
    rePassword=TextEditingController();
    email= Get.arguments["email"];
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  void goToSuccessResetPassword() async{
   if(password.text==rePassword.text && password.text.isNotEmpty){
     ResetPasswordData verifyCodeResetPasswordData=ResetPasswordData(crud: Get.find(),email: email,password: password.text);
     statuesRequest=StatuesRequest.loading;
     update();
     var response= await verifyCodeResetPasswordData.postData();
     print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
     print(response);
     statuesRequest= handlingData(response);
     if(statuesRequest==StatuesRequest.success){
       if(response["statues"]=="success"){
         Get.offNamed(AppRoutes.successResetPassword);
       }else{
         statuesRequest=StatuesRequest.fail;
       }
     }
   }else{
     Get.defaultDialog(
         title: "50".tr,
         content: Text("58".tr)
     );
   }
   update();
  }

  @override
  resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

}