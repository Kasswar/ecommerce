import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';

class Crud {
  Future<Either<StatuesRequest, Map>> postData(String link, Map data) async {
    var response = await http.post(Uri.parse(link), body: data);

    try{
      if (await checkInternet()) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          print("---------------------------");
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatuesRequest.serverFail);
        }
      } else {
        return const Left(StatuesRequest.offLine);
      }
    }catch(_){
      return const Left(StatuesRequest.serverExp);
    }
  }
}
