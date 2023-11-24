import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/datasourse/remote/favoritedata.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';

abstract class FavoriteController extends GetxController{
  favoriteAdd(String itemsId);
  favoriteDelete(String itemsId);
  favoriteChange(String itemsId,int value);
}

class FavoriteControllerImp extends FavoriteController{
  FavoriteData favoriteData=FavoriteData(crud: Get.find());
  MyServices myServices=Get.find();
  late StatuesRequest statuesRequest;
  Map favorite={};
  @override
  favoriteChange(String itemsId,int value){
    favorite[itemsId]=value;
    update();
  }

  @override
  favoriteAdd(String itemsId) async{
    var response= await favoriteData.favoriteAdd(myServices.sharedPreferences.getString("userId")!,itemsId);
    statuesRequest= handlingData(response);
    print(response);
    if(statuesRequest==StatuesRequest.success){
      if(response["statues"]=="fail"){

      }else{}
    }
    update();
  }

  @override
  favoriteDelete(String itemsId) async{
    var response= await favoriteData.favoriteDelete(myServices.sharedPreferences.getString("userId")!,itemsId);
    statuesRequest= handlingData(response);
    if(statuesRequest==StatuesRequest.success){
      if(response["statues"]=="fail"){

      }else{}
    }
    update();
  }
}