class DevataListResponse {
  String? status;
  String? message;
  List<DeviDevtaList>? data;

  DevataListResponse({this.status, this.message, this.data});

  DevataListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DeviDevtaList>[];
      json['data'].forEach((v) {
        data!.add(new DeviDevtaList.fromJson(v));
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

class DeviDevtaList {
  DevtaImage? image;
  String? sId;
  String? name;
  List<String>? otherNames;
  List<String>? associatedDeviDevta;
  String? description;
  List<String>? favourite;
  List<String>? geography;
  String? status;
  String? createdBy;
  String? lastModifiedBy;
  String? createdOn;
  String? lastModifiedOn;
  int? iV;
  String? gender;

  DeviDevtaList(
      {this.image,
      this.sId,
      this.name,
      this.otherNames,
      this.associatedDeviDevta,
      this.description,
      this.favourite,
      this.geography,
      this.status,
      this.createdBy,
      this.lastModifiedBy,
      this.createdOn,
      this.lastModifiedOn,
      this.iV,
      this.gender});

  DeviDevtaList.fromJson(Map<String, dynamic> json) {
    image =
        json['image'] != null ? new DevtaImage.fromJson(json['image']) : null;
    sId = json['_id'];
    name = json['name'];
    otherNames = json['other_names'].cast<String>();
    associatedDeviDevta = json['associated_devi_devta'].cast<String>();
    description = json['description'];
    favourite = json['favourite'].cast<String>();
    geography = json['geography'].cast<String>();
    status = json['status'];
    createdBy = json['created_by'];
    lastModifiedBy = json['last_modified_by'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
    iV = json['__v'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['other_names'] = this.otherNames;
    data['associated_devi_devta'] = this.associatedDeviDevta;
    data['description'] = this.description;
    data['favourite'] = this.favourite;
    data['geography'] = this.geography;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['last_modified_by'] = this.lastModifiedBy;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    data['__v'] = this.iV;
    data['gender'] = this.gender;
    return data;
  }
}

class DevtaImage {
  String? name;
  String? url;

  DevtaImage({this.name, this.url});

  DevtaImage.fromJson(Map<String, dynamic> json) {
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
