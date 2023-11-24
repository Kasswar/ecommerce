import '../../../core/class/crud.dart';
import '../../../core/constant/links.dart';

class CheckoutData {
  final Crud crud;

  CheckoutData({required this.crud});

  checkCoupon(String couponName) async {
    var response = await crud.postData(AppLinks.checkCoupon, {
      "couponName": couponName,
    });
    return response.fold((l) => l, (r) => r);
  }

  getUsingCoupon(String couponId, String userId) async {
    var response = await crud.postData(AppLinks.viewUsingCoupon, {
      "couponId": couponId,
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  addUsingCoupon(String couponId, String userId) async {
    var response = await crud.postData(AppLinks.addUsingCoupon, {
      "couponId": couponId,
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  addOrder(
    String userId,
    String addressId,
    String deliveryType,
    String deliveryPrice,
    String orderPrice,
    String orderTotalPrice,
    String paymentMethod,
    String couponId,
  ) async {
    var response = await crud.postData(AppLinks.addOrder, {
      "userId": userId,
      "addressId": addressId,
      "deliveryType": deliveryType,
      "deliveryPrice": deliveryPrice,
      "orderPrice": orderPrice,
      "orderTotalPrice": orderTotalPrice,
      "paymentMethod": paymentMethod,
      "couponId": couponId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
