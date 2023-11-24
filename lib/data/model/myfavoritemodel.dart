class MyFavoriteModel {
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
  int? favoriteId;
  int? favoriteUserid;
  int? favoriteItemsid;
  int? userId;

  MyFavoriteModel(
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
        this.favoriteId,
        this.favoriteUserid,
        this.favoriteItemsid,
        this.userId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
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
    favoriteId = json['favorite_id'];
    favoriteUserid = json['favorite_userid'];
    favoriteItemsid = json['favorite_itemsid'];
    userId = json['user_id'];
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
    data['favorite_id'] = this.favoriteId;
    data['favorite_userid'] = this.favoriteUserid;
    data['favorite_itemsid'] = this.favoriteItemsid;
    data['user_id'] = this.userId;
    return data;
  }
}