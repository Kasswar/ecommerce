import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class HomeData{
  final Crud crud;
  HomeData({required this.crud});
  getData()async{
    var response=await crud.postData(AppLinks.home,{});
    return response.fold((l) => l, (r) => r);
  }

  search(String userId,String search)async{
    var response=await crud.postData(AppLinks.search,{"userId":userId,"search":search});
    return response.fold((l) => l, (r) => r);
  }
}