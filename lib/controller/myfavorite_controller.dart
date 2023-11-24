import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/constant/links.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/datasourse/remote/myfavoritedata.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';
import 'homecontroller/search_controller.dart';

abstract class MyFavoriteController extends GetxController {
initialData();
getData();
deleteFromFavorite(String favoriteId);
search(String value);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  SearchControllerImp searchControllerImp=Get.put(SearchControllerImp());
  MyFavoriteData myFavoriteData =MyFavoriteData(crud: Get.find());
  MyServices myServices = Get.find();
  late StatuesRequest statuesRequest;
  bool isSearch=false;
  String? lang;
  List<MyFavoriteModel> data=[];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    lang=myServices.sharedPreferences.getString("lang");
    getData();
  }

  @override
  getData() async {
    data.clear();
    statuesRequest=StatuesRequest.loading;
    var response = await myFavoriteData.getData(
        myServices.sharedPreferences.getString("userId")!);
    statuesRequest = handlingData(response);
    if (statuesRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        statuesRequest=StatuesRequest.fail;
      } else {
        List responseData=response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("-------------Favorite-----------");
        print(data);
      }
    }
    update();
  }

  @override
  deleteFromFavorite(String favoriteId) {
    myFavoriteData.deleteFromFavorite(favoriteId);
    data.removeWhere((element) => element.favoriteId.toString()==favoriteId);
    update();
  }

  @override
  search(String value) async{
    if(value.isNotEmpty){
      isSearch=true;
      searchControllerImp.search(value);
    }else{
      isSearch=false;
    }
    update();
  }
}