import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class VerifyCodeResetPasswordData {
  final Crud crud;
  final String email;
  final String verifyCode;


  VerifyCodeResetPasswordData(
      {required this.email,
        required this.verifyCode,
        required this.crud});

  postData() async {
    var response = await crud.postData(AppLinks.verifyCodePassword, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}