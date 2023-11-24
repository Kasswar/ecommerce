import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/responsive/responsivewidget.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/verifycodesignup_controller.dart';
import '../../../core/constant/color.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "28".tr,
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: AppColor.grey),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controllerImp) => HandlingDataRequest(
          statuesRequest: controllerImp.statuesRequest,
          widget: ResponsiveWidget(
            builder: (context,deviceModel){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: controllerImp.statuesRequest == StatuesRequest.loading
                    ? const Center(
                  child: Text("Loading..."),
                )
                    : ListView(
                  children: [
                    SizedBox(
                      height: deviceModel.localHeight/22.5,
                    ),
                    const CustomTitleAuth(title: "29"),
                    SizedBox(
                      height: deviceModel.localHeight/50,
                    ),
                    CustomTextBodyAuth(textBody: "30" "${controllerImp.email}"),
                    SizedBox(
                      height: deviceModel.localHeight/22.5,
                    ),
                    SizedBox(
                      height: deviceModel.localHeight/11,
                      child: OtpTextField(
                        onSubmit: (String verificationCode) async {
                          await controllerImp.checkCode(verificationCode);
                        },
                        margin: const EdgeInsets.only(right: 4),
                        borderRadius: BorderRadius.circular(30),
                        fieldWidth: deviceModel.localWidth/7,
                        textStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                        enabledBorderColor: AppColor.primaryColor,
                        focusedBorderColor: AppColor.black,
                        numberOfFields: 5,
                        showFieldAsBox: true,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
