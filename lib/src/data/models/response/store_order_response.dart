class StoreCartOrderResponse {
  String? status;
  String? message;
  List<StoreOrderList>? data;

  StoreCartOrderResponse({this.status, this.message, this.data});

  StoreCartOrderResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StoreOrderList>[];
      json['data'].forEach((v) {
        data!.add(new StoreOrderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoreOrderList {
  String? userId;
  String? orderDate;
  StoreOrderAddressDetails? addressDetails;
  String? mobile;
  List<StoreGetOrderDetails>? orderDetails;
  String? paymentDetails;
  String? status;
  String? createdBy;
  String? sId;
  String? createdOn;
  String? lastModifiedOn;
  int? iV;

  StoreOrderList(
      {this.userId,
      this.orderDate,
      this.addressDetails,
      this.mobile,
      this.orderDetails,
      this.paymentDetails,
      this.status,
      this.createdBy,
      this.sId,
      this.createdOn,
      this.lastModifiedOn,
      this.iV});

  StoreOrderList.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    orderDate = json['order_date'];
    addressDetails = json['address_details'] != null
        ? new StoreOrderAddressDetails.fromJson(json['address_details'])
        : null;
    mobile = json['mobile'];
    if (json['order_details'] != null) {
      orderDetails = <StoreGetOrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new StoreGetOrderDetails.fromJson(v));
      });
    }
    paymentDetails = json['payment_details'];
    status = json['status'];
    createdBy = json['created_by'];
    sId = json['_id'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['order_date'] = this.orderDate;
    if (this.addressDetails != null) {
      data['address_details'] = this.addressDetails!.toJson();
    }
    data['mobile'] = this.mobile;
    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    data['payment_details'] = this.paymentDetails;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['_id'] = this.sId;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    data['__v'] = this.iV;
    return data;
  }
}

class StoreOrderAddressDetails {
  StoreOrderLocation? location;
  String? address;
  String? houseOrFlatNo;
  String? floor;
  String? locality;
  String? landmark;
  String? tag;
  String? pincode;
  String? city;
  String? state;
  String? country;

  StoreOrderAddressDetails(
      {this.location,
      this.address,
      this.houseOrFlatNo,
      this.floor,
      this.locality,
      this.landmark,
      this.tag,
      this.pincode,
      this.city,
      this.state,
      this.country});

  StoreOrderAddressDetails.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new StoreOrderLocation.fromJson(json['location'])
        : null;
    address = json['address'];
    houseOrFlatNo = json['house_or_flat_no'];
    floor = json['floor'];
    locality = json['locality'];
    landmark = json['landmark'];
    tag = json['tag'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['address'] = this.address;
    data['house_or_flat_no'] = this.houseOrFlatNo;
    data['floor'] = this.floor;
    data['locality'] = this.locality;
    data['landmark'] = this.landmark;
    data['tag'] = this.tag;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}

class StoreOrderLocation {
  String? type;
  List<num>? coordinates;

  StoreOrderLocation({this.type, this.coordinates});

  StoreOrderLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<num>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class StoreGetOrderDetails {
  int? orderAmount;
  int? orderQuantity;
  String? categoryId;
  String? itemId;
  String? sId;

  StoreGetOrderDetails(
      {this.orderAmount,
      this.orderQuantity,
      this.categoryId,
      this.itemId,
      this.sId});

  StoreGetOrderDetails.fromJson(Map<String, dynamic> json) {
    orderAmount = json['order_amount'];
    orderQuantity = json['order_quantity'];
    categoryId = json['category_id'];
    itemId = json['item_id'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_amount'] = this.orderAmount;
    data['order_quantity'] = this.orderQuantity;
    data['category_id'] = this.categoryId;
    data['item_id'] = this.itemId;
    data['_id'] = this.sId;
    return data;
  }
}
