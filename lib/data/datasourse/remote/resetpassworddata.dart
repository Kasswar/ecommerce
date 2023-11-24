import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class ResetPasswordData {
  final Crud crud;
  final String email;
  final String password;

  ResetPasswordData(
      {required this.email,
        required this.password,
        required this.crud});

  postData() async {
    var response = await crud.postData(AppLinks.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}