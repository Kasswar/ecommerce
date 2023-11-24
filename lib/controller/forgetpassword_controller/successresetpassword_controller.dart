import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{
  goToSignInPage();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{
  @override
  goToSignInPage() {
    Get.offNamed(AppRoutes.login);
  }

}