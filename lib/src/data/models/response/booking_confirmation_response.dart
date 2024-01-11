class BookingConfirmationResponse {
  String? status;
  String? message;
  List<BookingConfirmationData>? data;

  BookingConfirmationResponse({this.status, this.message, this.data});

  BookingConfirmationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BookingConfirmationData>[];
      json['data'].forEach((v) {
        data!.add(new BookingConfirmationData.fromJson(v));
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

class BookingConfirmationData {
  String? userId;
  String? bookingDate;
  String? transactionDate;
  AddressDetailss? addressDetails;
  String? fullName;
  String? mobile;
  num? bookingAmount;
  String? productId;
  String? paymentDetails;
  String? tier;
  String? status;
  String? createdBy;
  String? sId;
  String? createdOn;
  String? lastModifiedOn;
  num? iV;

  BookingConfirmationData(
      {this.userId,
      this.bookingDate,
      this.transactionDate,
      this.addressDetails,
      this.fullName,
      this.mobile,
      this.bookingAmount,
      this.productId,
      this.paymentDetails,
      this.tier,
      this.status,
      this.createdBy,
      this.sId,
      this.createdOn,
      this.lastModifiedOn,
      this.iV});

  BookingConfirmationData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    bookingDate = json['booking_date'];
    transactionDate = json['transaction_date'];
    addressDetails = json['address_details'] != null
        ? new AddressDetailss.fromJson(json['address_details'])
        : null;
    fullName = json['full_name'];
    mobile = json['mobile'];
    bookingAmount = json['booking_amount'];
    productId = json['product_id'];
    paymentDetails = json['paymentDetails'];
    tier = json['tier'];
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
    data['booking_date'] = this.bookingDate;
    data['transaction_date'] = this.transactionDate;
    if (this.addressDetails != null) {
      data['address_details'] = this.addressDetails!.toJson();
    }
    data['full_name'] = this.fullName;
    data['mobile'] = this.mobile;
    data['booking_amount'] = this.bookingAmount;
    data['product_id'] = this.productId;
    data['paymentDetails'] = this.paymentDetails;
    data['tier'] = this.tier;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['_id'] = this.sId;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    data['__v'] = this.iV;
    return data;
  }
}

class AddressDetailss {
  Locations? location;
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? country;

  AddressDetailss(
      {this.location,
      this.address,
      this.pincode,
      this.city,
      this.state,
      this.country});

  AddressDetailss.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Locations.fromJson(json['location'])
        : null;
    address = json['address'];
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
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}

class Locations {
  String? type;
  List<int>? coordinates;

  Locations({this.type, this.coordinates});

  Locations.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
