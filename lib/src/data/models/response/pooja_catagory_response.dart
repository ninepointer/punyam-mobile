class PoojaCategoryResponse {
  String? status;
  String? message;
  List<PoojaCategoryData>? data;

  PoojaCategoryResponse({this.status, this.message, this.data});

  PoojaCategoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PoojaCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new PoojaCategoryData.fromJson(v));
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

class PoojaCategoryData {
  Imagess? image;
  String? subCetegory;
  String? sId;
  String? name;
  String? description;
  List<String>? includes;
  List<String>? purpose;
  List<Benefits>? benefits;
  List<Items>? items;
  int? duration;
  String? type;
  List<Faq>? faq;
  List<Packages>? packages;
  String? category;
  String? subCategory;

  PoojaCategoryData(
      {this.image,
      this.subCetegory,
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
      this.subCategory});

  PoojaCategoryData.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Imagess.fromJson(json['image']) : null;
    subCetegory = json['sub_cetegory'];
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    includes = json['includes'].cast<String>();
    purpose = json['purpose'].cast<String>();
    if (json['benefits'] != null) {
      benefits = <Benefits>[];
      json['benefits'].forEach((v) {
        benefits!.add(new Benefits.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    duration = json['duration'];
    type = json['type'];
    if (json['faq'] != null) {
      faq = <Faq>[];
      json['faq'].forEach((v) {
        faq!.add(new Faq.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
    category = json['category'];
    subCategory = json['sub_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['sub_cetegory'] = this.subCetegory;
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
    return data;
  }
}

class Imagess {
  String? url;
  String? name;

  Imagess({this.url, this.name});

  Imagess.fromJson(Map<String, dynamic> json) {
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

class Benefits {
  String? header;
  String? description;
  String? sId;

  Benefits({this.header, this.description, this.sId});

  Benefits.fromJson(Map<String, dynamic> json) {
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

class Items {
  String? name;
  int? quantity;
  String? unit;
  String? sId;

  Items({this.name, this.quantity, this.unit, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
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

class Faq {
  String? question;
  String? answer;
  String? sId;

  Faq({this.question, this.answer, this.sId});

  Faq.fromJson(Map<String, dynamic> json) {
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

class Packages {
  Tier? tier;
  int? price;
  String? sId;

  Packages({this.tier, this.price, this.sId});

  Packages.fromJson(Map<String, dynamic> json) {
    tier = json['tier'] != null ? new Tier.fromJson(json['tier']) : null;
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tier != null) {
      data['tier'] = this.tier!.toJson();
    }
    data['price'] = this.price;
    data['_id'] = this.sId;
    return data;
  }
}

class Tier {
  String? sId;
  String? tierName;
  bool? poojaItemsIncluded;
  bool? postPoojaCleanUpIncluded;
  int? minPanditExperience;
  int? maxPanditExperience;
  int? numberOfMainPandit;
  int? numberOfAssistantPandit;

  Tier(
      {this.sId,
      this.tierName,
      this.poojaItemsIncluded,
      this.postPoojaCleanUpIncluded,
      this.minPanditExperience,
      this.maxPanditExperience,
      this.numberOfMainPandit,
      this.numberOfAssistantPandit});

  Tier.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tierName = json['tier_name'];
    poojaItemsIncluded = json['pooja_items_included'];
    postPoojaCleanUpIncluded = json['post_pooja_cleanUp_included'];
    minPanditExperience = json['min_pandit_experience'];
    maxPanditExperience = json['max_pandit_experience'];
    numberOfMainPandit = json['number_of_main_pandit'];
    numberOfAssistantPandit = json['number_of_assistant_pandit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tier_name'] = this.tierName;
    data['pooja_items_included'] = this.poojaItemsIncluded;
    data['post_pooja_cleanUp_included'] = this.postPoojaCleanUpIncluded;
    data['min_pandit_experience'] = this.minPanditExperience;
    data['max_pandit_experience'] = this.maxPanditExperience;
    data['number_of_main_pandit'] = this.numberOfMainPandit;
    data['number_of_assistant_pandit'] = this.numberOfAssistantPandit;
    return data;
  }
}
