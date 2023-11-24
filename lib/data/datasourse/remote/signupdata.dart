import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class SignUpData {
  final Crud crud;
  final String name;
  final String email;
  final String password;
  final String phone;

  SignUpData(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.crud});

  postData() async {
    var response = await crud.postData(AppLinks.signup, {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
