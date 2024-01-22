class StoreCatagoryResponse {
  String? status;
  String? message;
  List<StoreCatagoryList>? data;

  StoreCatagoryResponse({this.status, this.message, this.data});

  StoreCatagoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StoreCatagoryList>[];
      json['data'].forEach((v) {
        data!.add(new StoreCatagoryList.fromJson(v));
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

class StoreCatagoryList {
  StoreCatagoryImages? image;
  String? sId;
  String? name;
  String? description;
  String? status;
  String? createdOn;
  String? lastModifiedOn;

  StoreCatagoryList(
      {this.image,
      this.sId,
      this.name,
      this.description,
      this.status,
      this.createdOn,
      this.lastModifiedOn});

  StoreCatagoryList.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null
        ? new StoreCatagoryImages.fromJson(json['image'])
        : null;
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    return data;
  }
}

class StoreCatagoryImages {
  String? name;
  String? url;

  StoreCatagoryImages({this.name, this.url});

  StoreCatagoryImages.fromJson(Map<String, dynamic> json) {
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
