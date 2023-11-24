import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class OrderData {
  final Crud crud;
  OrderData({required this.crud});
  getPendingOrders(String userId) async {
    var response =
        await crud.postData(AppLinks.pendingOrder, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String userId, String orderId) async {
    var response = await crud.postData(AppLinks.deleteOrder, {
      'userId': userId,
      'orderId': orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
