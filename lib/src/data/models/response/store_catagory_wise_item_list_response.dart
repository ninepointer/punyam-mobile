class StoreCatagoryWiseItemsResponse {
  String? status;
  String? message;
  List<StoreCatagoryItemList>? data;

  StoreCatagoryWiseItemsResponse({this.status, this.message, this.data});

  StoreCatagoryWiseItemsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StoreCatagoryItemList>[];
      json['data'].forEach((v) {
        data!.add(new StoreCatagoryItemList.fromJson(v));
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

class StoreCatagoryItemList {
  StoreCatagoryItemImages? image;
  String? sId;
  String? name;
  int? minOrderQuantity;
  String? unit;
  num? price;
  bool? featured;
  bool? sponsored;
  String? description;
  Category? category;
  String? status;
  String? createdOn;
  String? lastModifiedOn;

  StoreCatagoryItemList(
      {this.image,
      this.sId,
      this.name,
      this.minOrderQuantity,
      this.unit,
      this.price,
      this.featured,
      this.sponsored,
      this.description,
      this.category,
      this.status,
      this.createdOn,
      this.lastModifiedOn});

  StoreCatagoryItemList.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null
        ? new StoreCatagoryItemImages.fromJson(json['image'])
        : null;
    sId = json['_id'];
    name = json['name'];
    minOrderQuantity = json['min_order_quantity'];
    unit = json['unit'];
    price = json['price'];
    featured = json['featured'];
    sponsored = json['sponsored'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    data['min_order_quantity'] = this.minOrderQuantity;
    data['unit'] = this.unit;
    data['price'] = this.price;
    data['featured'] = this.featured;
    data['sponsored'] = this.sponsored;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['status'] = this.status;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    return data;
  }
}

class StoreCatagoryItemImages {
  String? name;
  String? url;

  StoreCatagoryItemImages({this.name, this.url});

  StoreCatagoryItemImages.fromJson(Map<String, dynamic> json) {
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

class Category {
  String? sId;
  String? name;

  Category({this.sId, this.name});

  Category.fromJson(Map<String, dynamic> json) {
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
