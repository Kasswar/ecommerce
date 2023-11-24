import 'package:ecommerce/core/class/statuesrequest.dart';

StatuesRequest handlingData(response){
  if(response is StatuesRequest){
    return response;
  }else{
    return StatuesRequest.success;
  }
}