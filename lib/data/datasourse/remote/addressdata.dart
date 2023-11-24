import 'package:ecommerce/core/constant/links.dart';

import '../../../core/class/crud.dart';

class AddressData {
  final Crud crud;

  AddressData({required this.crud});

  getData(String userId) async {
    var response =
        await crud.postData(AppLinks.addressView, {"userId": userId});
    return response.fold((l) => l, (r) => r);
  }

  addData(String city, String street, String addressName, String lat,
      String long, String userId) async {
    var response = await crud.postData(
      AppLinks.addressAdd,
      {
        "city": city,
        "street":street,
        "addressName":addressName,
        "lat": lat,
        "long": long,
        "userId": userId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  updateData(String addressId,String city, String street, String addressName, String lat,
      String long, String userId) async {
    var response = await crud.postData(
      AppLinks.addressUpdate,
      {
        "addressId":addressId,
        "city": city,
        "street":street,
        "addressName":addressName,
        "lat": lat,
        "long": long,
        "userId": userId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressId,String userId) async {
    var response =
    await crud.postData(AppLinks.addressDelete,
        {
          "addressId":addressId,
          "userId": userId,
        });
    return response.fold((l) => l, (r) => r);
  }
}
