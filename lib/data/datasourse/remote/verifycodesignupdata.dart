import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class VerifyCodeSignUpData {
  final Crud crud;
  final String email;
  final String verifyCode;


  VerifyCodeSignUpData(
      {required this.email,
        required this.verifyCode,
        required this.crud});

  postData() async {
    var response = await crud.postData(AppLinks.verifyCode, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}