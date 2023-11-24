import 'package:get/get.dart';

validInput(String value, int min, int max, String type) {
  if(value.isEmpty){return "49".tr;}
  if (type == "userName") {
    if (!GetUtils.isUsername(value)) {
      return "44".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "45".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "46".tr;
    }
  }
  if(value.length > max){
    return "${"47".tr} $max";
  }
  if(value.length < min){
    return "${"48".tr} $min";
  }
}
