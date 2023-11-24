class OrderDetailsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsDiscount;
  double? itemsPrice;
  int? itemsActive;
  String? itemsDate;
  int? itemsCat;
  double? itemsPricediscount;
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersType;
  double? ordersDeliveryprice;
  double? ordersPrice;
  double? ordersTotalprice;
  int? ordersPaymentmethod;
  int? ordersStatus;
  int? ordersCoupon;
  String? ordersDatetime;
  int? cartId;
  int? cartUserid;
  int? cartItemsid;
  int? cartItemscount;
  int? cartOrdersid;
  int? addressId;
  String? addressCity;
  String? addressStreet;
  String? addressName;
  double? addressLat;
  double? addressLong;
  int? addressUserid;

  OrderDetailsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsDiscount,
      this.itemsPrice,
      this.itemsActive,
      this.itemsDate,
      this.itemsCat,
      this.itemsPricediscount,
      this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersType,
      this.ordersDeliveryprice,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersCoupon,
      this.ordersDatetime,
      this.cartId,
      this.cartUserid,
      this.cartItemsid,
      this.cartItemscount,
      this.cartOrdersid,
      this.addressId,
      this.addressCity,
      this.addressStreet,
      this.addressName,
      this.addressLat,
      this.addressLong,
      this.addressUserid});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsDiscount = json['items_discount'];
    itemsPrice = json['items_price'];
    itemsActive = json['items_active'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    itemsPricediscount = json['items_pricediscount'];
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersDeliveryprice = json['orders_deliveryprice'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemsid = json['cart_itemsid'];
    cartItemscount = json['cart_itemscount'];
    cartOrdersid = json['cart_ordersid'];
    addressId = json['address_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressName = json['address_name'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressUserid = json['address_userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_discount'] = this.itemsDiscount;
    data['items_price'] = this.itemsPrice;
    data['items_active'] = this.itemsActive;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['items_pricediscount'] = this.itemsPricediscount;
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_deliveryprice'] = this.ordersDeliveryprice;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_itemscount'] = this.cartItemscount;
    data['cart_ordersid'] = this.cartOrdersid;
    data['address_id'] = this.addressId;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_name'] = this.addressName;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_userid'] = this.addressUserid;
    return data;
  }
}
