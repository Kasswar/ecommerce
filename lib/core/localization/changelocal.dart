import 'package:ecommerce/core/constant/themes.dart';
import 'package:ecommerce/core/functions/fcmconfig.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  ThemeData myTheme = englishTheme;
  MyServices myServices = Get.find();

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myTheme = langCode == "en" ? englishTheme : arabicTheme;
    Get.changeTheme(myTheme);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //Get.snackbar("warning", "Please able Location services.",backgroundColor: Colors.white);
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("warning", "Please able Location services.",
            backgroundColor: Colors.white);
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
          "warning", "You can't use Application without Location services.",
          backgroundColor: Colors.white);
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    requestPermitionNotification();
    fcmConfig();
    determinePosition();
    String? langCode = myServices.sharedPreferences.getString("lang");
    if (langCode == "ar") {
      language = const Locale("ar");
      myTheme = arabicTheme;
    } else if (langCode == "en") {
      language = const Locale("en");
      myTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
