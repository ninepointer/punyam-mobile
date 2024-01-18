class SelectPoojaByIdResponse {
  String? status;
  String? message;
  SelectedPoojaByIdData? data;

  SelectPoojaByIdResponse({this.status, this.message, this.data});

  SelectPoojaByIdResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new SelectedPoojaByIdData.fromJson(json['data'])
        : null;
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

class SelectedPoojaByIdData {
  PoojaIdImage? image;
  String? sId;
  String? name;
  String? description;
  List<String>? includes;
  List<String>? purpose;
  List<Benefitss>? benefits;
  List<Itemss>? items;
  int? duration;
  String? type;
  List<Faqs>? faq;
  List<Packagess>? packages;
  String? category;
  String? subCategory;

  SelectedPoojaByIdData(
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
      this.subCategory});

  SelectedPoojaByIdData.fromJson(Map<String, dynamic> json) {
    image =
        json['image'] != null ? new PoojaIdImage.fromJson(json['image']) : null;
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    includes = json['includes'].cast<String>();
    purpose = json['purpose'].cast<String>();
    if (json['benefits'] != null) {
      benefits = <Benefitss>[];
      json['benefits'].forEach((v) {
        benefits!.add(new Benefitss.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Itemss>[];
      json['items'].forEach((v) {
        items!.add(new Itemss.fromJson(v));
      });
    }
    duration = json['duration'];
    type = json['type'];
    if (json['faq'] != null) {
      faq = <Faqs>[];
      json['faq'].forEach((v) {
        faq!.add(new Faqs.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <Packagess>[];
      json['packages'].forEach((v) {
        packages!.add(new Packagess.fromJson(v));
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

class PoojaIdImage {
  String? name;
  String? url;

  PoojaIdImage({this.name, this.url});

  PoojaIdImage.fromJson(Map<String, dynamic> json) {
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

class Benefitss {
  String? header;
  String? description;
  String? sId;

  Benefitss({this.header, this.description, this.sId});

  Benefitss.fromJson(Map<String, dynamic> json) {
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

class Itemss {
  String? name;
  int? quantity;
  String? unit;
  String? sId;

  Itemss({this.name, this.quantity, this.unit, this.sId});

  Itemss.fromJson(Map<String, dynamic> json) {
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

class Faqs {
  String? question;
  String? answer;
  String? sId;

  Faqs({this.question, this.answer, this.sId});

  Faqs.fromJson(Map<String, dynamic> json) {
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

class Packagess {
  Tiers? tier;
  num? price;
  String? sId;

  Packagess({this.tier, this.price, this.sId});

  Packagess.fromJson(Map<String, dynamic> json) {
    tier = json['tier'] != null ? new Tiers.fromJson(json['tier']) : null;
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

class Tiers {
  String? sId;
  String? tierName;
  bool? poojaItemsIncluded;
  bool? postPoojaCleanUpIncluded;
  int? minPanditExperience;
  int? maxPanditExperience;
  int? numberOfMainPandit;
  int? numberOfAssistantPandit;

  Tiers(
      {this.sId,
      this.tierName,
      this.poojaItemsIncluded,
      this.postPoojaCleanUpIncluded,
      this.minPanditExperience,
      this.maxPanditExperience,
      this.numberOfMainPandit,
      this.numberOfAssistantPandit});

  Tiers.fromJson(Map<String, dynamic> json) {
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
