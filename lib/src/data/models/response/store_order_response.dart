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
  StoreOrderAddressDetails? addressDetails;
  String? sId;
  String? userId;
  String? orderDate;
  String? mobile;
  StoreOrderPaymentDetails? paymentDetails;
  String? status;
  String? createdBy;
  String? createdOn;
  String? lastModifiedOn;
  int? iV;
  List<StoreGetOrderDetails>? itemDetails;

  StoreOrderList(
      {this.addressDetails,
      this.sId,
      this.userId,
      this.orderDate,
      this.mobile,
      this.paymentDetails,
      this.status,
      this.createdBy,
      this.createdOn,
      this.lastModifiedOn,
      this.iV,
      this.itemDetails});

  StoreOrderList.fromJson(Map<String, dynamic> json) {
    addressDetails = json['address_details'] != null
        ? new StoreOrderAddressDetails.fromJson(json['address_details'])
        : null;
    sId = json['_id'];
    userId = json['user_id'];
    orderDate = json['order_date'];
    mobile = json['mobile'];
    paymentDetails = json['payment_details'] != null
        ? new StoreOrderPaymentDetails.fromJson(json['payment_details'])
        : null;
    status = json['status'];
    createdBy = json['created_by'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
    iV = json['__v'];
    if (json['item_details'] != null) {
      itemDetails = <StoreGetOrderDetails>[];
      json['item_details'].forEach((v) {
        itemDetails!.add(new StoreGetOrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressDetails != null) {
      data['address_details'] = this.addressDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['order_date'] = this.orderDate;
    data['mobile'] = this.mobile;
    if (this.paymentDetails != null) {
      data['payment_details'] = this.paymentDetails!.toJson();
    }
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    data['__v'] = this.iV;
    if (this.itemDetails != null) {
      data['item_details'] = this.itemDetails!.map((v) => v.toJson()).toList();
    }
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

class StoreOrderPaymentDetails {
  String? sId;
  String? transactionId;
  String? paymentStatus;
  String? paymentMode;

  StoreOrderPaymentDetails(
      {this.sId, this.transactionId, this.paymentStatus, this.paymentMode});

  StoreOrderPaymentDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    transactionId = json['transaction_id'];
    paymentStatus = json['payment_status'];
    paymentMode = json['payment_mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['transaction_id'] = this.transactionId;
    data['payment_status'] = this.paymentStatus;
    data['payment_mode'] = this.paymentMode;
    return data;
  }
}

class StoreGetOrderDetails {
  int? orderAmount;
  int? orderQuantity;
  CategoryId? categoryId;
  StoreOrderItemId? itemId;
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
    categoryId = json['category_id'] != null
        ? new CategoryId.fromJson(json['category_id'])
        : null;
    itemId = json['item_id'] != null
        ? new StoreOrderItemId.fromJson(json['item_id'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_amount'] = this.orderAmount;
    data['order_quantity'] = this.orderQuantity;
    if (this.categoryId != null) {
      data['category_id'] = this.categoryId!.toJson();
    }
    if (this.itemId != null) {
      data['item_id'] = this.itemId!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class CategoryId {
  String? sId;
  String? name;

  CategoryId({this.sId, this.name});

  CategoryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class StoreOrderItemId {
  StoreOrderImage? image;
  String? sId;
  String? name;
  int? minOrderQuantity;
  String? unit;

  StoreOrderItemId(
      {this.image, this.sId, this.name, this.minOrderQuantity, this.unit});

  StoreOrderItemId.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null
        ? new StoreOrderImage.fromJson(json['image'])
        : null;
    sId = json['_id'];
    name = json['name'];
    minOrderQuantity = json['min_order_quantity'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['min_order_quantity'] = this.minOrderQuantity;
    data['unit'] = this.unit;
    return data;
  }
}

class StoreOrderImage {
  String? name;
  String? url;

  StoreOrderImage({this.name, this.url});

  StoreOrderImage.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

// class StoreCartOrderResponse {
//   String? status;
//   String? message;
//   List<StoreOrderList>? data;

//   StoreCartOrderResponse({this.status, this.message, this.data});

//   StoreCartOrderResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <StoreOrderList>[];
//       json['data'].forEach((v) {
//         data!.add(new StoreOrderList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class StoreOrderList {
//   StoreOrderAddressDetails? addressDetails;
//   String? sId;
//   String? userId;
//   String? orderDate;
//   String? mobile;
//   StoreOrderPaymentDetails? paymentDetails;
//   String? status;
//   String? createdBy;
//   String? createdOn;
//   String? lastModifiedOn;
//   int? iV;
//   List<StoreGetOrderDetails>? itemDetails;

//   StoreOrderList(
//       {this.addressDetails,
//       this.sId,
//       this.userId,
//       this.orderDate,
//       this.mobile,
//       this.paymentDetails,
//       this.status,
//       this.createdBy,
//       this.createdOn,
//       this.lastModifiedOn,
//       this.iV,
//       this.itemDetails});

//   StoreOrderList.fromJson(Map<String, dynamic> json) {
//     addressDetails = json['address_details'] != null
//         ? new StoreOrderAddressDetails.fromJson(json['address_details'])
//         : null;
//     sId = json['_id'];
//     userId = json['user_id'];
//     orderDate = json['order_date'];
//     mobile = json['mobile'];
//     paymentDetails = json['payment_details'] != null
//         ? new StoreOrderPaymentDetails.fromJson(json['payment_details'])
//         : null;
//     status = json['status'];
//     createdBy = json['created_by'];
//     createdOn = json['created_on'];
//     lastModifiedOn = json['last_modified_on'];
//     iV = json['__v'];
//     if (json['item_details'] != null) {
//       itemDetails = <StoreGetOrderDetails>[];
//       json['item_details'].forEach((v) {
//         itemDetails!.add(new StoreGetOrderDetails.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.addressDetails != null) {
//       data['address_details'] = this.addressDetails!.toJson();
//     }
//     data['_id'] = this.sId;
//     data['user_id'] = this.userId;
//     data['order_date'] = this.orderDate;
//     data['mobile'] = this.mobile;
//     if (this.paymentDetails != null) {
//       data['payment_details'] = this.paymentDetails!.toJson();
//     }
//     data['status'] = this.status;
//     data['created_by'] = this.createdBy;
//     data['created_on'] = this.createdOn;
//     data['last_modified_on'] = this.lastModifiedOn;
//     data['__v'] = this.iV;
//     if (this.itemDetails != null) {
//       data['item_details'] = this.itemDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class StoreOrderAddressDetails {
//   StoreOrderLocation? location;
//   String? address;
//   String? houseOrFlatNo;
//   String? floor;
//   String? locality;
//   String? landmark;
//   String? tag;
//   String? pincode;
//   String? city;
//   String? state;
//   String? country;

//   StoreOrderAddressDetails(
//       {this.location,
//       this.address,
//       this.houseOrFlatNo,
//       this.floor,
//       this.locality,
//       this.landmark,
//       this.tag,
//       this.pincode,
//       this.city,
//       this.state,
//       this.country});

//   StoreOrderAddressDetails.fromJson(Map<String, dynamic> json) {
//     location = json['location'] != null
//         ? new StoreOrderLocation.fromJson(json['location'])
//         : null;
//     address = json['address'];
//     houseOrFlatNo = json['house_or_flat_no'];
//     floor = json['floor'];
//     locality = json['locality'];
//     landmark = json['landmark'];
//     tag = json['tag'];
//     pincode = json['pincode'];
//     city = json['city'];
//     state = json['state'];
//     country = json['country'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     data['address'] = this.address;
//     data['house_or_flat_no'] = this.houseOrFlatNo;
//     data['floor'] = this.floor;
//     data['locality'] = this.locality;
//     data['landmark'] = this.landmark;
//     data['tag'] = this.tag;
//     data['pincode'] = this.pincode;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['country'] = this.country;
//     return data;
//   }
// }

// class StoreOrderLocation {
//   String? type;
//   List<num>? coordinates;

//   StoreOrderLocation({this.type, this.coordinates});

//   StoreOrderLocation.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     coordinates = json['coordinates'].cast<num>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['coordinates'] = this.coordinates;
//     return data;
//   }
// }

// class StoreOrderPaymentDetails {
//   String? sId;
//   String? transactionId;
//   String? paymentStatus;
//   String? paymentMode;

//   StoreOrderPaymentDetails(
//       {this.sId, this.transactionId, this.paymentStatus, this.paymentMode});

//   StoreOrderPaymentDetails.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     transactionId = json['transaction_id'];
//     paymentStatus = json['payment_status'];
//     paymentMode = json['payment_mode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['transaction_id'] = this.transactionId;
//     data['payment_status'] = this.paymentStatus;
//     data['payment_mode'] = this.paymentMode;
//     return data;
//   }
// }

// class StoreGetOrderDetails {
//   int? orderAmount;
//   int? orderQuantity;
//   CategoryId? categoryId;
//   CategoryId? itemId;
//   String? sId;

//   StoreGetOrderDetails(
//       {this.orderAmount,
//       this.orderQuantity,
//       this.categoryId,
//       this.itemId,
//       this.sId});

//   StoreGetOrderDetails.fromJson(Map<String, dynamic> json) {
//     orderAmount = json['order_amount'];
//     orderQuantity = json['order_quantity'];
//     categoryId = json['category_id'] != null
//         ? new CategoryId.fromJson(json['category_id'])
//         : null;
//     itemId = json['item_id'] != null
//         ? new CategoryId.fromJson(json['item_id'])
//         : null;
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['order_amount'] = this.orderAmount;
//     data['order_quantity'] = this.orderQuantity;
//     if (this.categoryId != null) {
//       data['category_id'] = this.categoryId!.toJson();
//     }
//     if (this.itemId != null) {
//       data['item_id'] = this.itemId!.toJson();
//     }
//     data['_id'] = this.sId;
//     return data;
//   }
// }

// class CategoryId {
//   String? sId;
//   String? name;

//   CategoryId({this.sId, this.name});

//   CategoryId.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     return data;
//   }
// }

