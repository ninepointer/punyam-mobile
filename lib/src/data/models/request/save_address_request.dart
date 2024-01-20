class SaveAddressRequest {
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? country;
  int? latitude;
  int? longitude;
  String? tag;
  String? contactName;
  String? contactNumber;
  String? landmark;
  String? locality;
  String? floor;
  String? houseOrFlatNo;

  SaveAddressRequest(
      {this.address,
      this.pincode,
      this.city,
      this.state,
      this.country,
      this.latitude,
      this.longitude,
      this.tag,
      this.contactName,
      this.contactNumber,
      this.landmark,
      this.locality,
      this.floor,
      this.houseOrFlatNo});

  SaveAddressRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    tag = json['tag'];
    contactName = json['contact_name'];
    contactNumber = json['contact_number'];
    landmark = json['landmark'];
    locality = json['locality'];
    floor = json['floor'];
    houseOrFlatNo = json['house_or_flat_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['tag'] = this.tag;
    data['contact_name'] = this.contactName;
    data['contact_number'] = this.contactNumber;
    data['landmark'] = this.landmark;
    data['locality'] = this.locality;
    data['floor'] = this.floor;
    data['house_or_flat_no'] = this.houseOrFlatNo;
    return data;
  }
}
