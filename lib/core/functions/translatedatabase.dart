import 'package:ecommerce/core/services/sevices.dart';
import 'package:get/get.dart';

String translateDataBase(String columnAr,String columnEn){
  MyServices myServices =Get.find();
  String? lang= myServices.sharedPreferences.getString("lang");
  if(lang=="ar"){
    return columnAr;
  }else{
    return columnEn;
  }
}