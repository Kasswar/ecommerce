import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class SearchData{
  final Crud crud;
  SearchData({required this.crud});

  search(String userId,String search)async{
    var response=await crud.postData(AppLinks.search,{"userId":userId,"search":search});
    return response.fold((l) => l, (r) => r);
  }
}