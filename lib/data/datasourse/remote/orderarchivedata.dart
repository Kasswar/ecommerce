import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class OrderArchiveData {
  final Crud crud;
  OrderArchiveData({required this.crud});
  getPendingOrders(String userId) async {
    var response =
        await crud.postData(AppLinks.archiveOrder, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }
}
