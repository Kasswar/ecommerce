import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class FavoriteData {
  final Crud crud;

  FavoriteData({required this.crud});

  favoriteAdd(String userId,String itemsId)async{
    var response = await crud.postData(AppLinks.favoriteAdd, {
      "userId":userId,
      "itemsId": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  favoriteDelete(String userId,String itemsId)async{
    var response = await crud.postData(AppLinks.favoriteDelete, {
      "userId":userId,
      "itemsId": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
