import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';
import '../data/datasourse/remote/test_data.dart';

class TestController extends GetxController{
  TestData testData=TestData(crud: Get.find());
  List data=[];
  late StatuesRequest statuesRequest;
  getData()async{
    statuesRequest=StatuesRequest.loading;
    var response= await testData.getData();
    statuesRequest= handlingData(response);
    if(statuesRequest==StatuesRequest.success){
      if(response["statues"]=="fail"){
        statuesRequest=StatuesRequest.fail;
      }else{
        data.addAll(response["data"]);
      }
    }
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}