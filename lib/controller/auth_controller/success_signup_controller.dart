import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController{
  goToSignInPage();
}

class SuccessSignUpControllerImp extends SuccessSignUpController{
  @override
  goToSignInPage() {
    Get.offNamed(AppRoutes.login);
  }

}