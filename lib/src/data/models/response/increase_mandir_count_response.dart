class IncreaseMandirCountResponse {
  String? status;
  String? message;
  IncraseMandirCountData? data;
  String? count;

  IncreaseMandirCountResponse(
      {this.status, this.message, this.data, this.count});

  IncreaseMandirCountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new IncraseMandirCountData.fromJson(json['data'])
        : null;
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['count'] = this.count;
    return data;
  }
}

class IncraseMandirCountData {
  IncraseMandirCountCoverImage? coverImage;
  IncraseMandirCountAddressDetails? addressDetails;
  String? sId;
  String? name;
  String? description;
  bool? dham;
  bool? popular;
  String? morningOpeningTime;
  String? morningClosingTime;
  String? eveningOpeningTime;
  String? eveningClosingTime;
  String? deviDevta;
  List<IncraseMandirCountImages>? images;
  List<String>? favourite;
  List<String>? share;
  int? constructionYear;
  String? panditMobileNumber;
  String? panditFullName;
  String? status;
  String? createdOn;
  String? lastModifiedOn;
  int? iV;
  List<IncraseMandirCountUniqueCount>? uniqueCount;
  int? viewCount;

  IncraseMandirCountData(
      {this.coverImage,
      this.addressDetails,
      this.sId,
      this.name,
      this.description,
      this.dham,
      this.popular,
      this.morningOpeningTime,
      this.morningClosingTime,
      this.eveningOpeningTime,
      this.eveningClosingTime,
      this.deviDevta,
      this.images,
      this.favourite,
      this.share,
      this.constructionYear,
      this.panditMobileNumber,
      this.panditFullName,
      this.status,
      this.createdOn,
      this.lastModifiedOn,
      this.iV,
      this.uniqueCount,
      this.viewCount});

  IncraseMandirCountData.fromJson(Map<String, dynamic> json) {
    coverImage = json['cover_image'] != null
        ? new IncraseMandirCountCoverImage.fromJson(json['cover_image'])
        : null;
    addressDetails = json['address_details'] != null
        ? new IncraseMandirCountAddressDetails.fromJson(json['address_details'])
        : null;
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    dham = json['dham'];
    popular = json['popular'];
    morningOpeningTime = json['morning_opening_time'];
    morningClosingTime = json['morning_closing_time'];
    eveningOpeningTime = json['evening_opening_time'];
    eveningClosingTime = json['evening_closing_time'];
    deviDevta = json['devi_devta'];
    if (json['images'] != null) {
      images = <IncraseMandirCountImages>[];
      json['images'].forEach((v) {
        images!.add(new IncraseMandirCountImages.fromJson(v));
      });
    }
    favourite = json['favourite']?.cast<String>() ?? [];
    share = json['share']?.cast<String>() ?? [];
    constructionYear = json['construction_year'];
    panditMobileNumber = json['pandit_mobile_number'];
    panditFullName = json['pandit_full_name'];
    status = json['status'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
    iV = json['__v'];
    if (json['uniqueCount'] != null) {
      uniqueCount = <IncraseMandirCountUniqueCount>[];
      json['uniqueCount'].forEach((v) {
        uniqueCount!.add(new IncraseMandirCountUniqueCount.fromJson(v));
      });
    }
    viewCount = json['viewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coverImage != null) {
      data['cover_image'] = this.coverImage!.toJson();
    }
    if (this.addressDetails != null) {
      data['address_details'] = this.addressDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['dham'] = this.dham;
    data['popular'] = this.popular;
    data['morning_opening_time'] = this.morningOpeningTime;
    data['morning_closing_time'] = this.morningClosingTime;
    data['evening_opening_time'] = this.eveningOpeningTime;
    data['evening_closing_time'] = this.eveningClosingTime;
    data['devi_devta'] = this.deviDevta;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['favourite'] = this.favourite;
    data['share'] = this.share;
    data['construction_year'] = this.constructionYear;
    data['pandit_mobile_number'] = this.panditMobileNumber;
    data['pandit_full_name'] = this.panditFullName;
    data['status'] = this.status;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    data['__v'] = this.iV;
    if (this.uniqueCount != null) {
      data['uniqueCount'] = this.uniqueCount!.map((v) => v.toJson()).toList();
    }
    data['viewCount'] = this.viewCount;
    return data;
  }
}

class IncraseMandirCountCoverImage {
  String? name;
  String? url;

  IncraseMandirCountCoverImage({this.name, this.url});

  IncraseMandirCountCoverImage.fromJson(Map<String, dynamic> json) {
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

class IncraseMandirCountAddressDetails {
  IncraseMandirCountLocation? location;
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? country;

  IncraseMandirCountAddressDetails(
      {this.location,
      this.address,
      this.pincode,
      this.city,
      this.state,
      this.country});

  IncraseMandirCountAddressDetails.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new IncraseMandirCountLocation.fromJson(json['location'])
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

class IncraseMandirCountLocation {
  String? type;
  List<num>? coordinates;

  IncraseMandirCountLocation({this.type, this.coordinates});

  IncraseMandirCountLocation.fromJson(Map<String, dynamic> json) {
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

class IncraseMandirCountImages {
  String? url;
  String? name;
  String? sId;

  IncraseMandirCountImages({this.url, this.name, this.sId});

  IncraseMandirCountImages.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['_id'] = this.sId;
    return data;
  }
}

class IncraseMandirCountUniqueCount {
  String? ip;
  bool? isMobile;
  String? country;
  String? time;
  String? sId;

  IncraseMandirCountUniqueCount(
      {this.ip, this.isMobile, this.country, this.time, this.sId});

  IncraseMandirCountUniqueCount.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    isMobile = json['isMobile'];
    country = json['country'];
    time = json['time'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip'] = this.ip;
    data['isMobile'] = this.isMobile;
    data['country'] = this.country;
    data['time'] = this.time;
    data['_id'] = this.sId;
    return data;
  }
}
