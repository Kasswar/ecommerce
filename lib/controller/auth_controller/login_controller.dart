import 'package:ecommerce/data/datasourse/remote/signindata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statuesrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/sevices.dart';

abstract class LoginController extends GetxController {
  login();
  void goToSignUpPage();
  void goToForgetPasswordPage();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  StatuesRequest? statuesRequest;
  MyServices myServices = Get.find();
  @override
  goToSignUpPage() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  login() async {
    var formState = key.currentState;
    if (formState!.validate()) {
      SignInData signInData = SignInData(
          crud: Get.find(), email: email.text, password: password.text);
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await signInData.postData();
      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
        if (response["statues"] == "success") {
          if (response["data"]["user_approve"] == 1) {
            int id = response["data"]["user_id"];
            myServices.sharedPreferences
                .setString("userId", "${response["data"]["user_id"]}");
            myServices.sharedPreferences
                .setString("userName", "${response["data"]["user_name"]}");
            myServices.sharedPreferences
                .setString("email", "${response["data"]["user_email"]}");
            myServices.sharedPreferences
                .setString("phone", "${response["data"]["user_phone"]}");
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users$id");
            Get.offNamed(AppRoutes.homeScreen);
          } else {
            Get.offNamed(AppRoutes.verifyCodeEmail, arguments: {
              "email": "${response["data"]["user_email"]}",
            });
          }
        } else {
          statuesRequest = StatuesRequest.fail;
          Get.defaultDialog(
            title: "50".tr,
            content: Text("56".tr),
          );
        }
      }
      update();
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPasswordPage() {
    Get.offNamed(AppRoutes.forgetPassword);
  }
}
