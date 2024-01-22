class PlaceOrderRequest {
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? country;
  num? latitude;
  num? longitude;
  String? landmark;
  String? locality;
  String? floor;
  String? houseOrFlatNo;
  String? mobile;
  List<PlaceOrderDetails>? orderDetails;

  PlaceOrderRequest({
    this.address,
    this.pincode,
    this.city,
    this.state,
    this.country,
    this.latitude,
    this.longitude,
    this.landmark,
    this.locality,
    this.floor,
    this.houseOrFlatNo,
    this.mobile,
    this.orderDetails,
  });

  PlaceOrderRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    landmark = json['landmark'];
    locality = json['locality'];
    floor = json['floor'];
    houseOrFlatNo = json['house_or_flat_no'];
    mobile = json['mobile'];
    if (json['order_details'] != null) {
      orderDetails = List<PlaceOrderDetails>.from(
        json['order_details'].map((x) => PlaceOrderDetails.fromJson(x)),
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address'] = address;
    data['pincode'] = pincode;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['landmark'] = landmark;
    data['locality'] = locality;
    data['floor'] = floor;
    data['house_or_flat_no'] = houseOrFlatNo;
    data['mobile'] = mobile;
    if (orderDetails != null) {
      data['order_details'] = orderDetails!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

class PlaceOrderDetails {
  num? orderAmount;
  int? orderQuantity;
  String? categoryId;
  String? itemId;

  PlaceOrderDetails({
    this.orderAmount,
    this.orderQuantity,
    this.categoryId,
    this.itemId,
  });

  PlaceOrderDetails.fromJson(Map<String, dynamic> json) {
    orderAmount = json['order_amount'];
    orderQuantity = json['order_quantity'];
    categoryId = json['category_id'];
    itemId = json['item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['order_amount'] = orderAmount;
    data['order_quantity'] = orderQuantity;
    data['category_id'] = categoryId;
    data['item_id'] = itemId;
    return data;
  }
}
