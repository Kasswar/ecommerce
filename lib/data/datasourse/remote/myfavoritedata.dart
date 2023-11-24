import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class MyFavoriteData {
  final Crud crud;

  MyFavoriteData({required this.crud});

  getData(String userId)async{
    var response = await crud.postData(AppLinks.favoriteView, {
      "userId":userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFromFavorite(String favoriteId)async{
    var response = await crud.postData(AppLinks.deleteFromFavorite, {
      "favoriteId":favoriteId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
