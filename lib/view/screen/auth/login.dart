import 'package:ecommerce/controller/auth_controller/login_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/functions/alertdialogapp.dart';
import 'package:ecommerce/core/responsive/responsivewidget.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customlogoauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextloginorsignup.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custompasswordauth.dart';
import '../../widget/auth/customtextformauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controllerImp = Get.put(LoginControllerImp());
    return WillPopScope(
      onWillPop: () {
        return alertExitDialog();
      },
      child: Form(
        key: controllerImp.key,
        child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            title: Text(
              "2".tr,
            ),
            titleTextStyle: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
            backgroundColor: AppColor.backgroundColor,
            elevation: 0,
            centerTitle: true,
          ),
          body: GetBuilder<LoginControllerImp>(
            builder: (controllerImp) =>
                HandlingDataRequest(statuesRequest: controllerImp.statuesRequest, widget:ResponsiveWidget(
                  builder: (context,deviceModel){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ListView(
                        children: [
                          CustomLogoAuth(
                            width: deviceModel.localWidth/1.45,
                            height: deviceModel.localHeight/3.64,
                          ),
                          const CustomTitleAuth(title: "3"),
                          SizedBox(
                            height: deviceModel.localHeight/70,
                          ),
                          const CustomTextBodyAuth(textBody: "4"),
                          SizedBox(
                            height: deviceModel.localHeight/30,
                          ),
                          CustomTextFormAuth(
                            myHint: "5",
                            myLabel: "6",
                            myIcon: Icons.email_outlined,
                            keyboard: TextInputType.emailAddress,
                            myController: controllerImp.email,
                            validInput: (String? value) {
                              return validInput(value!, 15, 50, "email");
                            },
                          ),
                          SizedBox(
                            height: deviceModel.localHeight/30,
                          ),
                          CustomPasswordAuth(
                            myHint: "7",
                            myLabel: "8",
                            myController: controllerImp.password,
                            validInput: (String? value) {
                              return validInput(value!, 6, 25, "password");
                            },
                          ),
                          SizedBox(
                            height: deviceModel.localHeight/70,
                          ),
                          InkWell(
                            child: Text(
                              "9".tr,
                              textAlign: TextAlign.end,
                            ),
                            onTap: () {
                              controllerImp.goToForgetPasswordPage();
                            },
                          ),
                          SizedBox(
                            height: deviceModel.localHeight/70,
                          ),
                          CustomButtonAuth(
                            height: deviceModel.localHeight/17,
                            text: "2",
                            onPressed: () {
                              controllerImp.login();
                            },
                          ),
                          SizedBox(
                            height: deviceModel.localHeight/26,
                          ),
                          CustomTextLoginOrSignUp(
                              textOne: "10",
                              textTwo: "11",
                              onTap: () {
                                controllerImp.goToSignUpPage();
                              }),
                        ],
                      ),
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
