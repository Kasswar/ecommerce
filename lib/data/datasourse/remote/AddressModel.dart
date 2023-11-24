class AddressModel {
  int? addressId;
  String? addressCity;
  String? addressStreet;
  String? addressName;
  double? addressLat;
  double? addressLong;
  int? addressUserid;

  AddressModel(
      {this.addressId,
        this.addressCity,
        this.addressStreet,
        this.addressName,
        this.addressLat,
        this.addressLong,
        this.addressUserid});

  AddressModel.fromJson(Map<String, dynamic> json) {
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