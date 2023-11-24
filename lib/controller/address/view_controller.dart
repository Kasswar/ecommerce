import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/datasourse/remote/addressdata.dart';
import 'package:get/get.dart';

import '../../data/datasourse/remote/AddressModel.dart';

abstract class ViewAddressController extends GetxController{
  onInitial();
  getData();
  deleteData(String addressId);
}

class ViewAddressControllerImp extends ViewAddressController{

  AddressData addressData=AddressData(crud: Get.find());
  StatuesRequest? statuesRequest;
  List<AddressModel> addressModelList=[];
  MyServices myServices=Get.find();

  @override
  void onInit()async{
    await onInitial();
    super.onInit();
  }

  @override
  onInitial() async{
    await getData();
  }

  @override
  getData()async{
    statuesRequest=StatuesRequest.loading;
    update();
    var response=await addressData.getData(myServices.sharedPreferences.getString("userId")!);
    statuesRequest=handlingData(response);
    print("--------*-*-*-*--------");
    print(response['data']);
    if(response['statues']=='success'){
      List data=response['data'];
      addressModelList.addAll(data.map((e) =>AddressModel.fromJson(e)));
    }else{
      statuesRequest = StatuesRequest.fail;
    }
    update();
  }

  @override
  deleteData(String addressId)async{
    var response=await addressData.deleteData(addressId,myServices.sharedPreferences.getString("userId")!);
    statuesRequest=handlingData(response);
    print("--------*-*-*-*--------");
    print(response['statues']);
  }

}