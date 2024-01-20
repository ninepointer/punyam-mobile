class SaveAddressResponse {
  String? status;
  String? message;
  SaveAddressData? data;

  SaveAddressResponse({this.status, this.message, this.data});

  SaveAddressResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new SaveAddressData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SaveAddressData {
  String? sId;
  List<SaveAddressDetails>? addressDetails;

  SaveAddressData({this.sId, this.addressDetails});

  SaveAddressData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['address_details'] != null) {
      addressDetails = <SaveAddressDetails>[];
      json['address_details'].forEach((v) {
        addressDetails!.add(new SaveAddressDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.addressDetails != null) {
      data['address_details'] =
          this.addressDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaveAddressDetails {
  SaveAddressLocation? location;
  String? address;
  String? houseOrFlatNo;
  String? floor;
  String? locality;
  String? landmark;
  String? tag;
  String? contactName;
  String? contactNumber;
  String? pincode;
  String? city;
  String? state;
  String? country;
  String? sId;

  SaveAddressDetails(
      {this.location,
      this.address,
      this.houseOrFlatNo,
      this.floor,
      this.locality,
      this.landmark,
      this.tag,
      this.contactName,
      this.contactNumber,
      this.pincode,
      this.city,
      this.state,
      this.country,
      this.sId});

  SaveAddressDetails.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new SaveAddressLocation.fromJson(json['location'])
        : null;
    address = json['address'];
    houseOrFlatNo = json['house_or_flat_no'];
    floor = json['floor'];
    locality = json['locality'];
    landmark = json['landmark'];
    tag = json['tag'];
    contactName = json['contact_name'];
    contactNumber = json['contact_number'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    sId = json['_id'];
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
    data['contact_name'] = this.contactName;
    data['contact_number'] = this.contactNumber;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['_id'] = this.sId;
    return data;
  }
}

class SaveAddressLocation {
  String? type;
  List<double>? coordinates;

  SaveAddressLocation({this.type, this.coordinates});

  SaveAddressLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
