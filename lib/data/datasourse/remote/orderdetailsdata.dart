import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class OrderDetailsData {
  final Crud crud;
  OrderDetailsData({required this.crud});
  getData(String userId, String orderId) async {
    var response = await crud.postData(AppLinks.orderDetailsView, {
      'userId': userId,
      'orderId': orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
