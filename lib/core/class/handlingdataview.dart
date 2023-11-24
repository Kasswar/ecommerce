import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatuesRequest? statuesRequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.statuesRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statuesRequest == StatuesRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading,))
        : statuesRequest == StatuesRequest.offLine
            ?  Center(child: Lottie.asset(AppImageAsset.noInternet,width: 150,height: 150))
            : statuesRequest == StatuesRequest.fail
                ? Center(child: Lottie.asset(AppImageAsset.noData,width: 200,height: 200))
                : statuesRequest == StatuesRequest.serverFail
                    ? Center(
                        child: Lottie.asset(AppImageAsset.error404,width: 250,height: 250),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatuesRequest? statuesRequest;
  final Widget widget;

  const HandlingDataRequest(
      {Key? key, required this.statuesRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statuesRequest == StatuesRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading,))
        : statuesRequest == StatuesRequest.offLine
        ?  Center(child: Lottie.asset(AppImageAsset.noInternet,width: 150,height: 150))
        : statuesRequest == StatuesRequest.serverFail
        ? Center(
      child: Lottie.asset(AppImageAsset.error404,width: 250,height: 250),
    ): widget;
  }
}