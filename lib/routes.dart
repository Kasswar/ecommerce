import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middleware/mymiddleware.dart';
import 'package:ecommerce/view/screen/address/add.dart';
import 'package:ecommerce/view/screen/address/view.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/checkout.dart';
import 'package:ecommerce/view/screen/home/home.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/view/screen/home/homescreen.dart';
import 'package:ecommerce/view/screen/home/itemdetails.dart';
import 'package:ecommerce/view/screen/home/items.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/myfavorite.dart';
import 'package:ecommerce/view/screen/notification.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/order/order.dart';
import 'package:ecommerce/view/screen/order/orderdetails.dart';
import 'package:get/get.dart';

import 'view/screen/order/orderarchive.dart';

List<GetPage<dynamic>>? routes = [
  //---------------AuthPages------------------------
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(
    name: AppRoutes.verifyCodeEmail,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(
    name: AppRoutes.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  //--------------------------------------------------
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoarding(),
  ),
  GetPage(
    name: AppRoutes.homeScreen,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.items,
    page: () => const Items(),
  ),
  GetPage(
    name: AppRoutes.itemDetails,
    page: () => const ItemDetails(),
  ),
  GetPage(
    name: AppRoutes.myFavorite,
    page: () => const MyFavorite(),
  ),
  GetPage(
    name: AppRoutes.cart,
    page: () => const Cart(),
  ),
  //-----------address---------------------------------
  GetPage(
    name: AppRoutes.addressView,
    page: () => const AddressView(),
  ),
  GetPage(
    name: AppRoutes.addressAdd,
    page: () => const AddressAdd(),
  ),
  //-----------checkout--------------------------------
  GetPage(
    name: AppRoutes.checkout,
    page: () => const CheckoutScreen(),
  ),
  //-----------order-----------------------------------
  GetPage(
    name: AppRoutes.ordersView,
    page: () => const OrdersScreen(),
  ),
  GetPage(
    name: AppRoutes.orderDetails,
    page: () => const OrderDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.orderArchive,
    page: () => const OrdersArchiveScreen(),
  ),
  //-----------notifications---------------------------
  GetPage(
    name: AppRoutes.notifications,
    page: () => const NotificationsScreen(),
  ),
];
