import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/responsive/responsivewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custombuttonlang.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData= MediaQuery.of(context);
    double width= mediaQueryData.size.width;
    double height= mediaQueryData.size.height;
    print("-------------------------------------");
    print(width);
    print(height);
    return Scaffold(
      body:SizedBox(
        width: width,
        height: height,
        child: ResponsiveWidget(
          builder: (context,deviceModel){
            return Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1".tr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: deviceModel.localHeight/40,
                  ),
                  CustomButtonLang(
                    minWidth: deviceModel.localWidth*4/5,
                    height: deviceModel.localHeight/20,
                    textButton: "عربي",
                    onPressed: () {
                      Get.toNamed(AppRoutes.onBoarding);
                      controller.changeLang("ar");
                    },
                  ),
                  SizedBox(
                    height: deviceModel.localHeight/40,
                  ),
                  CustomButtonLang(
                    minWidth: deviceModel.localWidth*4/5,
                    height: deviceModel.localHeight/20,
                    textButton: "English",
                    onPressed: () {
                      Get.toNamed(AppRoutes.onBoarding);
                      controller.changeLang("en");
                    },
                  ),
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
