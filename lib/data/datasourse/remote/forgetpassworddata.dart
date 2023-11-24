import '../../../core/class/crud.dart';
import '../../../core/constant/links.dart';

class ForgetPasswordData{
  final Crud crud;
  final String email;


  ForgetPasswordData(
      {required this.email,
        required this.crud});

  postData() async {
    var response = await crud.postData(AppLinks.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}