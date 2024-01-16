class IncreasePoojaCountPetchResponse {
  String? status;
  String? message;
  IncrasePoojaCountData? data;
  String? count;

  IncreasePoojaCountPetchResponse(
      {this.status, this.message, this.data, this.count});

  IncreasePoojaCountPetchResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new IncrasePoojaCountData.fromJson(json['data'])
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

class IncrasePoojaCountData {
  IncreasePoojaImage? image;
  String? sId;
  String? name;
  String? description;
  List<String>? includes;
  List<String>? purpose;
  List<IncrasePoojaCountBenefits>? benefits;
  List<IncrasePoojaCountItems>? items;
  int? duration;
  String? type;
  List<IncrasePoojaCountFaq>? faq;
  List<IncrasePoojaCountPackages>? packages;
  String? category;
  String? subCategory;
  bool? featured;
  int? viewCount;

  IncrasePoojaCountData(
      {this.image,
      this.sId,
      this.name,
      this.description,
      this.includes,
      this.purpose,
      this.benefits,
      this.items,
      this.duration,
      this.type,
      this.faq,
      this.packages,
      this.category,
      this.subCategory,
      this.featured,
      this.viewCount});

  IncrasePoojaCountData.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null
        ? new IncreasePoojaImage.fromJson(json['image'])
        : null;
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    includes = json['includes'].cast<String>();
    purpose = json['purpose'].cast<String>();
    if (json['benefits'] != null) {
      benefits = <IncrasePoojaCountBenefits>[];
      json['benefits'].forEach((v) {
        benefits!.add(new IncrasePoojaCountBenefits.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <IncrasePoojaCountItems>[];
      json['items'].forEach((v) {
        items!.add(new IncrasePoojaCountItems.fromJson(v));
      });
    }
    duration = json['duration'];
    type = json['type'];
    if (json['faq'] != null) {
      faq = <IncrasePoojaCountFaq>[];
      json['faq'].forEach((v) {
        faq!.add(new IncrasePoojaCountFaq.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <IncrasePoojaCountPackages>[];
      json['packages'].forEach((v) {
        packages!.add(new IncrasePoojaCountPackages.fromJson(v));
      });
    }
    category = json['category'];
    subCategory = json['sub_category'];
    featured = json['featured'];
    viewCount = json['viewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['includes'] = this.includes;
    data['purpose'] = this.purpose;
    if (this.benefits != null) {
      data['benefits'] = this.benefits!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['duration'] = this.duration;
    data['type'] = this.type;
    if (this.faq != null) {
      data['faq'] = this.faq!.map((v) => v.toJson()).toList();
    }
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['featured'] = this.featured;
    data['viewCount'] = this.viewCount;
    return data;
  }
}

class IncreasePoojaImage {
  String? name;
  String? url;

  IncreasePoojaImage({this.name, this.url});

  IncreasePoojaImage.fromJson(Map<String, dynamic> json) {
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

class IncrasePoojaCountBenefits {
  String? header;
  String? description;
  String? sId;

  IncrasePoojaCountBenefits({this.header, this.description, this.sId});

  IncrasePoojaCountBenefits.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    description = json['description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['description'] = this.description;
    data['_id'] = this.sId;
    return data;
  }
}

class IncrasePoojaCountItems {
  String? name;
  int? quantity;
  String? unit;
  String? sId;

  IncrasePoojaCountItems({this.name, this.quantity, this.unit, this.sId});

  IncrasePoojaCountItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    unit = json['unit'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['unit'] = this.unit;
    data['_id'] = this.sId;
    return data;
  }
}

class IncrasePoojaCountFaq {
  String? question;
  String? answer;
  String? sId;

  IncrasePoojaCountFaq({this.question, this.answer, this.sId});

  IncrasePoojaCountFaq.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['_id'] = this.sId;
    return data;
  }
}

class IncrasePoojaCountPackages {
  String? tier;
  int? price;
  String? sId;

  IncrasePoojaCountPackages({this.tier, this.price, this.sId});

  IncrasePoojaCountPackages.fromJson(Map<String, dynamic> json) {
    tier = json['tier'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tier'] = this.tier;
    data['price'] = this.price;
    data['_id'] = this.sId;
    return data;
  }
}
