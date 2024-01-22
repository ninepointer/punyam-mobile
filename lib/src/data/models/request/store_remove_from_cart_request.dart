class RemoveFromcartRequest {
  String? itemId;

  RemoveFromcartRequest({this.itemId});

  RemoveFromcartRequest.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;

    return data;
  }
}
