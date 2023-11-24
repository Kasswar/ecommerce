import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/mybinding.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/test.dart';
import 'package:ecommerce/view/screen/address/view.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/home/items.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      title: 'ecommerce',
      initialBinding: MyBinding(),
      translations: MyTranslation(),
      locale: controller.language,
      theme: controller.myTheme,
      debugShowCheckedModeBanner: false,
      getPages: routes,
      //home: Language(),
    );
  }
}
