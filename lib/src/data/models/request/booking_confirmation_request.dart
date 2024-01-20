class BookingConfirmationRequest {
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? country;
  num? latitude;
  num? longitude;
  String? contactName;
  String? contactNumber;
  String? landmark;
  String? locality;
  String? floor;
  String? houseOrFlatNo;
  String? fullName;
  String? mobile;
  String? bookingAmount;
  String? bookingDate;
  String? poojaId;
  String? tierId;

  BookingConfirmationRequest(
      {this.address,
      this.pincode,
      this.city,
      this.state,
      this.country,
      this.latitude,
      this.longitude,
      this.contactName,
      this.contactNumber,
      this.landmark,
      this.locality,
      this.floor,
      this.houseOrFlatNo,
      this.fullName,
      this.mobile,
      this.bookingAmount,
      this.bookingDate,
      this.poojaId,
      this.tierId});

  BookingConfirmationRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    contactName = json['contact_name'];
    contactNumber = json['contact_number'];
    landmark = json['landmark'];
    locality = json['locality'];
    floor = json['floor'];
    houseOrFlatNo = json['house_or_flat_no'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    bookingAmount = json['booking_amount'];
    bookingDate = json['booking_date'];
    poojaId = json['poojaId'];
    tierId = json['tierId'];
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
    data['contact_name'] = this.contactName;
    data['contact_number'] = this.contactNumber;
    data['landmark'] = this.landmark;
    data['locality'] = this.locality;
    data['floor'] = this.floor;
    data['house_or_flat_no'] = this.houseOrFlatNo;
    data['full_name'] = this.fullName;
    data['mobile'] = this.mobile;
    data['booking_amount'] = this.bookingAmount;
    data['booking_date'] = this.bookingDate;
    data['poojaId'] = this.poojaId;
    data['tierId'] = this.tierId;
    return data;
  }
}
