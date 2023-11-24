import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class ItemsData {
  final Crud crud;

  ItemsData({required this.crud});

  getData(String categoriesId, String userId) async {
    var response = await crud.postData(AppLinks.items, {
      "categoriesId": categoriesId,
      "userId":userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
