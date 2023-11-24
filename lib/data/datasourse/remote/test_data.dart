import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class TestData{
  final Crud crud;
  TestData({required this.crud});
  getData()async{
    var response=await crud.postData(AppLinks.test,{});
   return response.fold((l) => l, (r) => r);
  }
}