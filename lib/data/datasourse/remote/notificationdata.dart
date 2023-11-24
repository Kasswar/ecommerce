import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class NotificationData {
  final Crud crud;
  NotificationData({required this.crud});
  getNotifications(String userId) async {
    var response = await crud.postData(AppLinks.notification, {
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
