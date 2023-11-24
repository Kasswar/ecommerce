import 'package:ecommerce/controller/auth_controller/success_signup_controller.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/responsive/responsivewidget.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../core/constant/color.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controllerImp =Get.put(SuccessSignUpControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: ResponsiveWidget(
            builder:(context,deviceModel){
              return Padding(
                padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                          AppImageAsset.success,
                          width: deviceModel.localWidth/1.8,
                          height:deviceModel.localHeight/4,
                        )),
                    const CustomTitleAuth(title:"43"),
                    SizedBox(height:deviceModel.localHeight/30,),
                    const CustomTextBodyAuth(textBody: "41"),
                    SizedBox(height:deviceModel.localHeight/17,),
                    SizedBox(
                        width: deviceModel.localWidth,
                        child: CustomButtonAuth(
                          height: deviceModel.localHeight/17,
                          text:"2",onPressed: (){
                          controllerImp.goToSignInPage();
                        },)),
                  ],
                ),
              );
            }));
  }
}
