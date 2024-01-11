class BookingConfirmationRequest {
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? country;
  num? latitude;
  num? longitude;
  String? fullName;
  String? mobile;
  String? bookingAmount;
  String? poojaId;
  String? tierId;
  String? bookingDate;

  BookingConfirmationRequest(
      {this.address,
      this.pincode,
      this.city,
      this.state,
      this.country,
      this.latitude,
      this.longitude,
      this.fullName,
      this.mobile,
      this.bookingAmount,
      this.poojaId,
      this.tierId,
      this.bookingDate});

  BookingConfirmationRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    bookingAmount = json['booking_amount'];
    poojaId = json['poojaId'];
    tierId = json['tierId'];
    bookingDate = json['booking_date'];
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
    data['full_name'] = this.fullName;
    data['mobile'] = this.mobile;
    data['booking_amount'] = this.bookingAmount;
    data['poojaId'] = this.poojaId;
    data['tierId'] = this.tierId;
    data['booking_date'] = this.bookingDate;
    return data;
  }
}
