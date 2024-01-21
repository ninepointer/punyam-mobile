class StoreCartResponse {
  String? status;
  String? message;
  List<StoreCartList>? data;

  StoreCartResponse({this.status, this.message, this.data});

  StoreCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StoreCartList>[];
      json['data'].forEach((v) {
        data!.add(new StoreCartList.fromJson(v));
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

class StoreCartList {
  ItemId? itemId;
  int? quantity;
  String? sId;

  StoreCartList({this.itemId, this.quantity, this.sId});

  StoreCartList.fromJson(Map<String, dynamic> json) {
    itemId =
        json['itemId'] != null ? new ItemId.fromJson(json['itemId']) : null;
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemId != null) {
      data['itemId'] = this.itemId!.toJson();
    }
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}

class ItemId {
  CartImage? image;
  String? sId;
  String? name;
  int? minOrderQuantity;
  String? unit;
  num? price;
  bool? featured;
  bool? sponsored;
  String? description;
  String? status;
  String? createdOn;
  String? lastModifiedOn;
  int? iV;
  String? lastModifiedBy;
  String? category;

  ItemId(
      {this.image,
      this.sId,
      this.name,
      this.minOrderQuantity,
      this.unit,
      this.price,
      this.featured,
      this.sponsored,
      this.description,
      this.status,
      this.createdOn,
      this.lastModifiedOn,
      this.iV,
      this.lastModifiedBy,
      this.category});

  ItemId.fromJson(Map<String, dynamic> json) {
    image =
        json['image'] != null ? new CartImage.fromJson(json['image']) : null;
    sId = json['_id'];
    name = json['name'];
    minOrderQuantity = json['min_order_quantity'];
    unit = json['unit'];
    price = json['price'];
    featured = json['featured'];
    sponsored = json['sponsored'];
    description = json['description'];
    status = json['status'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
    iV = json['__v'];
    lastModifiedBy = json['last_modified_by'];
    category = json['category'];
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
    data['status'] = this.status;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    data['__v'] = this.iV;
    data['last_modified_by'] = this.lastModifiedBy;
    data['category'] = this.category;
    return data;
  }
}

class CartImage {
  String? name;
  String? url;

  CartImage({this.name, this.url});

  CartImage.fromJson(Map<String, dynamic> json) {
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
