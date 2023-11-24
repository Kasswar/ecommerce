class AppLinks {
  //-----------mainRoutes-----------------------
  static const String server = "http://192.168.101.9/ecommerce";
  static const String auth = "$server/auth";
  static const String forgetPassword = "$server/forgetpassword";
  static const String routeImage = "$server/upload";
  static const String favorite = "$server/favorite";
  static const String cart = "$server/cart";
  static const String address = "$server/address";
  static const String coupon = "$server/coupon";
  static const String order = "$server/order";
  //-----------auth-----------------------------
  static const String signup = "$auth/signup.php";
  static const String signIn = "$auth/signin.php";
  static const String verifyCode = "$auth/verifycode.php";
  //-----------resetPassword--------------------
  static const String checkEmail = "$forgetPassword/checkemail.php";
  static const String verifyCodePassword =
      "$forgetPassword/verifycodepassword.php";
  static const String resetPassword = "$forgetPassword/resetpassword.php";
  //-----------home-----------------------------
  static const String home = "$server/home.php";
  //-----------items----------------------------
  static const String items = "$server/items/view.php";
  static const String search = "$server/items/search.php";
  //-----------favorite-------------------------
  static const String favoriteAdd = "$favorite/add.php";
  static const String favoriteDelete = "$favorite/delete.php";
  static const String favoriteView = "$favorite/view.php";
  static const String deleteFromFavorite = "$favorite/deletefromfavorite.php";
  //-----------cart-----------------------------
  static const String cartAdd = "$cart/add.php";
  static const String cartView = "$cart/view.php";
  static const String cartGetCount = "$cart/getcountcart.php";
  static const String cartPriceCount = "$cart/pricecount.php";
  //-----------address--------------------------
  static const String addressAdd = "$address/add.php";
  static const String addressView = "$address/view.php";
  static const String addressUpdate = "$address/update.php";
  static const String addressDelete = "$address/delete.php";
  //-----------coupon---------------------------
  static const String checkCoupon = "$coupon/checkcoupon.php";
  static const String addUsingCoupon = "$coupon/addusingcoupon.php";
  static const String viewUsingCoupon = "$coupon/viewusingcoupon.php";
  //-----------order----------------------------
  static const String addOrder = "$order/add.php";
  static const String deleteOrder = "$order/delete.php";
  static const String pendingOrder = "$order/pending.php";
  static const String archiveOrder = "$order/archive.php";
  static const String orderDetailsView = "$order/orderdetailsview.php";
  //-----------notification--------------------
  static const String notification = "$server/notification.php";
  //-----------image----------------------------
  static const String categoriesImage = "$routeImage/categories";
  static const String itemsImage = "$routeImage/items";
  //-----------test-----------------------------
  static const String test = "$server/test.php";
}
