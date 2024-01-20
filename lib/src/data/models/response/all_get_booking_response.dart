// class GatAllBookingResponse {
//   String? status;
//   String? message;
//   List<BookingOrderData>? data;

//   GatAllBookingResponse({this.status, this.message, this.data});

//   GatAllBookingResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <BookingOrderData>[];
//       json['data'].forEach((v) {
//         data!.add(new BookingOrderData.fromJson(v));
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

// class BookingOrderData {
//   BookingOrderAddressDetails? addressDetails;
//   String? sId;
//   String? userId;
//   String? bookingDate;
//   String? transactionDate;
//   String? fullName;
//   String? mobile;
//   int? bookingAmount;
//   String? productId;
//   SpecificProductId? specificProductId;
//   BookingOrderTier? tier;

//   BookingOrderData(
//       {this.addressDetails,
//       this.sId,
//       this.userId,
//       this.bookingDate,
//       this.transactionDate,
//       this.fullName,
//       this.mobile,
//       this.bookingAmount,
//       this.productId,
//       this.specificProductId,
//       this.tier});

//   BookingOrderData.fromJson(Map<String, dynamic> json) {
//     addressDetails = json['address_details'] != null
//         ? new BookingOrderAddressDetails.fromJson(json['address_details'])
//         : null;
//     sId = json['_id'];
//     userId = json['user_id'];
//     bookingDate = json['booking_date'];
//     transactionDate = json['transaction_date'];
//     fullName = json['full_name'];
//     mobile = json['mobile'];
//     bookingAmount = json['booking_amount'];
//     productId = json['product_id'];
//     specificProductId = json['specific_product_id'] != null
//         ? new SpecificProductId.fromJson(json['specific_product_id'])
//         : null;
//     tier = json['tier'] != null
//         ? new BookingOrderTier.fromJson(json['tier'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.addressDetails != null) {
//       data['address_details'] = this.addressDetails!.toJson();
//     }
//     data['_id'] = this.sId;
//     data['user_id'] = this.userId;
//     data['booking_date'] = this.bookingDate;
//     data['transaction_date'] = this.transactionDate;
//     data['full_name'] = this.fullName;
//     data['mobile'] = this.mobile;
//     data['booking_amount'] = this.bookingAmount;
//     data['product_id'] = this.productId;
//     if (this.specificProductId != null) {
//       data['specific_product_id'] = this.specificProductId!.toJson();
//     }
//     if (this.tier != null) {
//       data['tier'] = this.tier!.toJson();
//     }
//     return data;
//   }
// }

// class BookingOrderAddressDetails {
//   BookingOrderLocation? location;
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

//   BookingOrderAddressDetails(
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

//   BookingOrderAddressDetails.fromJson(Map<String, dynamic> json) {
//     location = json['location'] != null
//         ? new BookingOrderLocation.fromJson(json['location'])
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

// class BookingOrderLocation {
//   String? type;
//   List<num>? coordinates;

//   BookingOrderLocation({this.type, this.coordinates});

//   BookingOrderLocation.fromJson(Map<String, dynamic> json) {
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

// class SpecificProductId {
//   String? sId;
//   String? name;

//   SpecificProductId({this.sId, this.name});

//   SpecificProductId.fromJson(Map<String, dynamic> json) {
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

// class BookingOrderTier {
//   String? sId;
//   String? tierName;
//   bool? poojaItemsIncluded;
//   bool? postPoojaCleanUpIncluded;
//   int? minPanditExperience;
//   int? maxPanditExperience;
//   int? numberOfMainPandit;
//   int? numberOfAssistantPandit;

//   BookingOrderTier(
//       {this.sId,
//       this.tierName,
//       this.poojaItemsIncluded,
//       this.postPoojaCleanUpIncluded,
//       this.minPanditExperience,
//       this.maxPanditExperience,
//       this.numberOfMainPandit,
//       this.numberOfAssistantPandit});

//   BookingOrderTier.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     tierName = json['tier_name'];
//     poojaItemsIncluded = json['pooja_items_included'];
//     postPoojaCleanUpIncluded = json['post_pooja_cleanUp_included'];
//     minPanditExperience = json['min_pandit_experience'];
//     maxPanditExperience = json['max_pandit_experience'];
//     numberOfMainPandit = json['number_of_main_pandit'];
//     numberOfAssistantPandit = json['number_of_assistant_pandit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['tier_name'] = this.tierName;
//     data['pooja_items_included'] = this.poojaItemsIncluded;
//     data['post_pooja_cleanUp_included'] = this.postPoojaCleanUpIncluded;
//     data['min_pandit_experience'] = this.minPanditExperience;
//     data['max_pandit_experience'] = this.maxPanditExperience;
//     data['number_of_main_pandit'] = this.numberOfMainPandit;
//     data['number_of_assistant_pandit'] = this.numberOfAssistantPandit;
//     return data;
//   }
// }
class GatAllBookingResponse {
  String? status;
  String? message;
  List<BookingOrderData>? data;

  GatAllBookingResponse({this.status, this.message, this.data});

  GatAllBookingResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BookingOrderData>[];
      json['data'].forEach((v) {
        data!.add(new BookingOrderData.fromJson(v));
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

class BookingOrderData {
  BookingOrderAddressDetails? addressDetails;
  String? sId;
  String? userId;
  String? bookingDate;
  String? transactionDate;
  String? fullName;
  String? mobile;
  int? bookingAmount;
  String? productId;
  SpecificProductId? specificProductId;
  BookingOrderTier? tier;
  String? status;

  BookingOrderData(
      {this.addressDetails,
      this.sId,
      this.userId,
      this.bookingDate,
      this.transactionDate,
      this.fullName,
      this.mobile,
      this.bookingAmount,
      this.productId,
      this.specificProductId,
      this.tier,
      this.status});

  BookingOrderData.fromJson(Map<String, dynamic> json) {
    addressDetails = json['address_details'] != null
        ? new BookingOrderAddressDetails.fromJson(json['address_details'])
        : null;
    sId = json['_id'];
    userId = json['user_id'];
    bookingDate = json['booking_date'];
    transactionDate = json['transaction_date'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    bookingAmount = json['booking_amount'];
    productId = json['product_id'];
    specificProductId = json['specific_product_id'] != null
        ? new SpecificProductId.fromJson(json['specific_product_id'])
        : null;
    tier = json['tier'] != null
        ? new BookingOrderTier.fromJson(json['tier'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressDetails != null) {
      data['address_details'] = this.addressDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['booking_date'] = this.bookingDate;
    data['transaction_date'] = this.transactionDate;
    data['full_name'] = this.fullName;
    data['mobile'] = this.mobile;
    data['booking_amount'] = this.bookingAmount;
    data['product_id'] = this.productId;
    if (this.specificProductId != null) {
      data['specific_product_id'] = this.specificProductId!.toJson();
    }
    if (this.tier != null) {
      data['tier'] = this.tier!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class BookingOrderAddressDetails {
  BookingOrderLocation? location;
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

  BookingOrderAddressDetails(
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

  BookingOrderAddressDetails.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new BookingOrderLocation.fromJson(json['location'])
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

class BookingOrderLocation {
  String? type;
  List<num>? coordinates;

  BookingOrderLocation({this.type, this.coordinates});

  BookingOrderLocation.fromJson(Map<String, dynamic> json) {
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

class SpecificProductId {
  String? sId;
  String? name;

  SpecificProductId({this.sId, this.name});

  SpecificProductId.fromJson(Map<String, dynamic> json) {
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

class BookingOrderTier {
  String? sId;
  String? tierName;
  bool? poojaItemsIncluded;
  bool? postPoojaCleanUpIncluded;
  int? minPanditExperience;
  int? maxPanditExperience;
  int? numberOfMainPandit;
  int? numberOfAssistantPandit;

  BookingOrderTier(
      {this.sId,
      this.tierName,
      this.poojaItemsIncluded,
      this.postPoojaCleanUpIncluded,
      this.minPanditExperience,
      this.maxPanditExperience,
      this.numberOfMainPandit,
      this.numberOfAssistantPandit});

  BookingOrderTier.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tierName = json['tier_name'];
    poojaItemsIncluded = json['pooja_items_included'];
    postPoojaCleanUpIncluded = json['post_pooja_cleanUp_included'];
    minPanditExperience = json['min_pandit_experience'];
    maxPanditExperience = json['max_pandit_experience'];
    numberOfMainPandit = json['number_of_main_pandit'];
    numberOfAssistantPandit = json['number_of_assistant_pandit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tier_name'] = this.tierName;
    data['pooja_items_included'] = this.poojaItemsIncluded;
    data['post_pooja_cleanUp_included'] = this.postPoojaCleanUpIncluded;
    data['min_pandit_experience'] = this.minPanditExperience;
    data['max_pandit_experience'] = this.maxPanditExperience;
    data['number_of_main_pandit'] = this.numberOfMainPandit;
    data['number_of_assistant_pandit'] = this.numberOfAssistantPandit;
    return data;
  }
}
