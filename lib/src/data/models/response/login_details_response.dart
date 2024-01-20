class LoginDetailsResponse {
  String? status;
  String? message;
  Data? data;

  LoginDetailsResponse({this.status, this.message, this.data});

  LoginDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String? sId;
  String? fullName;
  String? mobile;
  String? dob;
  String? gender;
  String? language;
  String? maritalStatus;
  ProfilePhoto? profilePhoto;
  String? email;
  List<String>? bookings;
  String? status;
  String? joiningDate;
  Role? role;
  String? creationProcess;
  List<String>? favouriteMandirs;
  List<String>? favouriteDeviDevta;
  List<AddressDetails>? addressDetails;
  String? createdOn;
  String? lastModifiedOn;
  List<FcmTokens>? fcmTokens;
  int? iV;
  String? mobileOtp;
  String? lastOtpTime;

  Data(
      {this.sId,
      this.fullName,
      this.mobile,
      this.dob,
      this.gender,
      this.language,
      this.maritalStatus,
      this.profilePhoto,
      this.email,
      this.bookings,
      this.status,
      this.joiningDate,
      this.role,
      this.creationProcess,
      this.favouriteMandirs,
      this.favouriteDeviDevta,
      this.addressDetails,
      this.createdOn,
      this.lastModifiedOn,
      this.fcmTokens,
      this.iV,
      this.mobileOtp,
      this.lastOtpTime});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    dob = json['dob'];
    gender = json['gender'];
    language = json['language'];
    maritalStatus = json['marital_status'];
    profilePhoto = json['profile_photo'] != null
        ? new ProfilePhoto.fromJson(json['profile_photo'])
        : null;
    email = json['email'];
    bookings = json['bookings'].cast<String>();
    status = json['status'];
    joiningDate = json['joining_date'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    creationProcess = json['creation_process'];
    favouriteMandirs = json['favourite_mandirs'].cast<String>();
    favouriteDeviDevta = json['favourite_devi_devta'].cast<String>();
    if (json['address_details'] != null) {
      addressDetails = <AddressDetails>[];
      json['address_details'].forEach((v) {
        addressDetails!.add(new AddressDetails.fromJson(v));
      });
    }
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
    if (json['fcm_tokens'] != null) {
      fcmTokens = <FcmTokens>[];
      json['fcm_tokens'].forEach((v) {
        fcmTokens!.add(new FcmTokens.fromJson(v));
      });
    }
    iV = json['__v'];
    mobileOtp = json['mobile_otp'];
    lastOtpTime = json['last_otp_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['full_name'] = this.fullName;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['language'] = this.language;
    data['marital_status'] = this.maritalStatus;
    if (this.profilePhoto != null) {
      data['profile_photo'] = this.profilePhoto!.toJson();
    }
    data['email'] = this.email;
    data['bookings'] = this.bookings;
    data['status'] = this.status;
    data['joining_date'] = this.joiningDate;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['creation_process'] = this.creationProcess;
    data['favourite_mandirs'] = this.favouriteMandirs;
    data['favourite_devi_devta'] = this.favouriteDeviDevta;
    if (this.addressDetails != null) {
      data['address_details'] =
          this.addressDetails!.map((v) => v.toJson()).toList();
    }
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    if (this.fcmTokens != null) {
      data['fcm_tokens'] = this.fcmTokens!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['mobile_otp'] = this.mobileOtp;
    data['last_otp_time'] = this.lastOtpTime;
    return data;
  }
}

class ProfilePhoto {
  String? url;
  String? name;

  ProfilePhoto({this.url, this.name});

  ProfilePhoto.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    return data;
  }
}

class Role {
  String? sId;
  String? roleName;

  Role({this.sId, this.roleName});

  Role.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['roleName'] = this.roleName;
    return data;
  }
}

class AddressDetails {
  Location? location;
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? country;

  AddressDetails(
      {this.location,
      this.address,
      this.pincode,
      this.city,
      this.state,
      this.country});

  AddressDetails.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
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

class Location {
  String? type;
  List<num>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
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

class FcmTokens {
  String? token;
  String? brand;
  String? model;
  String? platform;
  List<String>? tags;
  String? sId;
  String? createdAt;

  FcmTokens(
      {this.token,
      this.brand,
      this.model,
      this.platform,
      this.tags,
      this.sId,
      this.createdAt});

  FcmTokens.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    brand = json['brand'];
    model = json['model'];
    platform = json['platform'];
    tags = json['tags'].cast<String>();
    sId = json['_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['platform'] = this.platform;
    data['tags'] = this.tags;
    data['_id'] = this.sId;
    data['created_at'] = this.createdAt;
    return data;
  }
}
