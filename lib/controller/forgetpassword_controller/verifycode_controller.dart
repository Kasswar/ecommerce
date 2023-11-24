import 'package:ecommerce/data/datasourse/remote/verifycoderesetpassworddata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statuesrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode(String verifyCode);
  void goToResetPasswordPage();
}

class VerifyCodeControllerImp extends VerifyCodeController{
  late String email;
  StatuesRequest? statuesRequest;
  List data=[];

  @override
  void onInit() {
    email= Get.arguments["email"];
    print("----------------------------");
    print(email);
    super.onInit();
  }

  @override
  checkCode(String verifyCode)async{
    VerifyCodeResetPasswordData verifyCodeResetPasswordData=VerifyCodeResetPasswordData(crud: Get.find(),email: email,verifyCode: verifyCode);
    statuesRequest=StatuesRequest.loading;
    update();
    var response= await verifyCodeResetPasswordData.postData();
    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    print(response["statues"]);
    statuesRequest= handlingData(response);
    if(statuesRequest==StatuesRequest.success){
      if(response["statues"]=="success"){
        Get.offNamed(AppRoutes.resetPassword,arguments: {"email":email});
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
  void goToResetPasswordPage() {
    Get.toNamed(AppRoutes.resetPassword);
  }

}