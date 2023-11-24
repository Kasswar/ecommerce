import 'package:ecommerce/core/class/crud.dart';
import 'package:get/get.dart';

import 'controller/forgetpassword_controller/forgetpassword_controller.dart';
import 'controller/auth_controller/signup_controller.dart';

class MyBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut<SignUpControllerImp>(() => SignUpControllerImp(),fenix: true);
    Get.lazyPut<ForgetPasswordControllerImp>(() => ForgetPasswordControllerImp(),fenix: true);
  }
}