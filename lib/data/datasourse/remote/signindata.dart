import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class SignInData {
  final Crud crud;
  final String email;
  final String password;

  SignInData(
      {required this.email,
        required this.password,
        required this.crud});

  postData() async {
    var response = await crud.postData(AppLinks.signIn, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}