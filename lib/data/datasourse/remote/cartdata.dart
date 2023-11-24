import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class CartData {
  final Crud crud;

  CartData({required this.crud});

  cartAdd(String userId,String itemsId,String itemsCount)async{
    var response = await crud.postData(AppLinks.cartAdd, {
      "userId":userId,
      "itemsId": itemsId,
      "itemsCount":itemsCount,
    });
    return response.fold((l) => l, (r) => r);
  }

  cartView(String userId)async{
    var response = await crud.postData(AppLinks.cartView, {
      "userId":userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  cartPriceCount(String userId)async{
    var response = await crud.postData(AppLinks.cartPriceCount, {
      "userId":userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  cartGetCount(String userId,String itemsId)async{
    var response = await crud.postData(AppLinks.cartGetCount, {
      "userId":userId,
      "itemsId": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName)async{
    var response = await crud.postData(AppLinks.checkCoupon, {
      "couponName":couponName,
    });
    return response.fold((l) => l, (r) => r);
  }

  getUsingCoupon(String couponId,String userId)async{
    var response = await crud.postData(AppLinks.viewUsingCoupon, {
      "couponId":couponId,
      "userId":userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  addUsingCoupon(String couponId,String userId)async{
    var response = await crud.postData(AppLinks.addUsingCoupon, {
      "couponId":couponId,
      "userId":userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
