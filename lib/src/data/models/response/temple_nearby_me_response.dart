class TempleNearMeResponse {
  String? status;
  String? message;
  List<TempleNearByMeList>? data;

  TempleNearMeResponse({this.status, this.message, this.data});

  TempleNearMeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TempleNearByMeList>[];
      json['data'].forEach((v) {
        data!.add(new TempleNearByMeList.fromJson(v));
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

class TempleNearByMeList {
  String? name;
  String? description;
  TempleNearByMeCoverImage? coverImage;
  bool? dham;
  bool? popular;
  String? morningOpeningTime;
  String? morningClosingTime;
  String? eveningOpeningTime;
  String? eveningClosingTime;
  TempleNearByMeAddressDetails? addressDetails;
  List<TempleNearByMeImages>? images;
  int? constructionYear;
  double? distance;
  String? deviDevta;

  TempleNearByMeList(
      {this.name,
      this.description,
      this.coverImage,
      this.dham,
      this.popular,
      this.morningOpeningTime,
      this.morningClosingTime,
      this.eveningOpeningTime,
      this.eveningClosingTime,
      this.addressDetails,
      this.images,
      this.constructionYear,
      this.distance,
      this.deviDevta});

  TempleNearByMeList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    coverImage = json['cover_image'] != null
        ? new TempleNearByMeCoverImage.fromJson(json['cover_image'])
        : null;
    dham = json['dham'];
    popular = json['popular'];
    morningOpeningTime = json['morning_opening_time'];
    morningClosingTime = json['morning_closing_time'];
    eveningOpeningTime = json['evening_opening_time'];
    eveningClosingTime = json['evening_closing_time'];
    addressDetails = json['address_details'] != null
        ? new TempleNearByMeAddressDetails.fromJson(json['address_details'])
        : null;
    if (json['images'] != null) {
      images = <TempleNearByMeImages>[];
      json['images'].forEach((v) {
        images!.add(new TempleNearByMeImages.fromJson(v));
      });
    }
    constructionYear = json['construction_year'];
    distance = json['distance'];
    deviDevta = json['devi_devta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.coverImage != null) {
      data['cover_image'] = this.coverImage!.toJson();
    }
    data['dham'] = this.dham;
    data['popular'] = this.popular;
    data['morning_opening_time'] = this.morningOpeningTime;
    data['morning_closing_time'] = this.morningClosingTime;
    data['evening_opening_time'] = this.eveningOpeningTime;
    data['evening_closing_time'] = this.eveningClosingTime;
    if (this.addressDetails != null) {
      data['address_details'] = this.addressDetails!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['construction_year'] = this.constructionYear;
    data['distance'] = this.distance;
    data['devi_devta'] = this.deviDevta;
    return data;
  }
}

class TempleNearByMeCoverImage {
  String? name;
  String? url;

  TempleNearByMeCoverImage({this.name, this.url});

  TempleNearByMeCoverImage.fromJson(Map<String, dynamic> json) {
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

class TempleNearByMeAddressDetails {
  TempleNearByMeLocation? location;
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? country;

  TempleNearByMeAddressDetails(
      {this.location,
      this.address,
      this.pincode,
      this.city,
      this.state,
      this.country});

  TempleNearByMeAddressDetails.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new TempleNearByMeLocation.fromJson(json['location'])
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

class TempleNearByMeLocation {
  String? type;
  List<double>? coordinates;

  TempleNearByMeLocation({this.type, this.coordinates});

  TempleNearByMeLocation.fromJson(Map<String, dynamic> json) {
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

class TempleNearByMeImages {
  String? url;
  String? name;
  String? sId;

  TempleNearByMeImages({this.url, this.name, this.sId});

  TempleNearByMeImages.fromJson(Map<String, dynamic> json) {
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
