class AllMandirResponse {
  String? status;
  String? message;
  List<AllMandirData>? data;

  AllMandirResponse({this.status, this.message, this.data});

  AllMandirResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AllMandirData>[];
      json['data'].forEach((v) {
        data!.add(new AllMandirData.fromJson(v));
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

class AllMandirData {
  MandirCoverImage? coverImage;
  MandirAddressDetails? addressDetails;
  String? sId;
  String? name;
  String? description;
  bool? dham;
  bool? popular;
  String? morningOpeningTime;
  String? morningClosingTime;
  String? eveningOpeningTime;
  String? eveningClosingTime;
  DeviDevta? deviDevta;
  List<MandirImages>? images;
  int? constructionYear;
  String? panditMobileNumber;
  String? panditFullName;
  String? status;

  AllMandirData(
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
      this.constructionYear,
      this.panditMobileNumber,
      this.panditFullName,
      this.status});

  AllMandirData.fromJson(Map<String, dynamic> json) {
    coverImage = json['cover_image'] != null
        ? new MandirCoverImage.fromJson(json['cover_image'])
        : null;
    addressDetails = json['address_details'] != null
        ? new MandirAddressDetails.fromJson(json['address_details'])
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
    deviDevta = json['devi_devta'] != null
        ? new DeviDevta.fromJson(json['devi_devta'])
        : null;
    if (json['images'] != null) {
      images = <MandirImages>[];
      json['images'].forEach((v) {
        images!.add(new MandirImages.fromJson(v));
      });
    }
    constructionYear = json['construction_year'];
    panditMobileNumber = json['pandit_mobile_number'];
    panditFullName = json['pandit_full_name'];
    status = json['status'];
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
    if (this.deviDevta != null) {
      data['devi_devta'] = this.deviDevta!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['construction_year'] = this.constructionYear;
    data['pandit_mobile_number'] = this.panditMobileNumber;
    data['pandit_full_name'] = this.panditFullName;
    data['status'] = this.status;
    return data;
  }
}

class MandirCoverImage {
  String? name;
  String? url;

  MandirCoverImage({this.name, this.url});

  MandirCoverImage.fromJson(Map<String, dynamic> json) {
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

class MandirAddressDetails {
  MandirLocation? location;
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? country;

  MandirAddressDetails(
      {this.location,
      this.address,
      this.pincode,
      this.city,
      this.state,
      this.country});

  MandirAddressDetails.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new MandirLocation.fromJson(json['location'])
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

class MandirLocation {
  String? type;
  List<num>? coordinates;

  MandirLocation({this.type, this.coordinates});

  MandirLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = (json['coordinates'] as List?)?.map((e) => e as num).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class DeviDevta {
  String? sId;
  String? name;

  DeviDevta({this.sId, this.name});

  DeviDevta.fromJson(Map<String, dynamic> json) {
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

class MandirImages {
  String? url;
  String? name;
  String? sId;

  MandirImages({this.url, this.name, this.sId});

  MandirImages.fromJson(Map<String, dynamic> json) {
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
