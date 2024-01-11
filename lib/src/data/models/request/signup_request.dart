class SignupRequest {
  String? fullName;

  String? email;
  String? mobile;
  String? gender;
  String? city;
  String? state;
  String? country;
  bool? termsAndConditions;
  String? referrerCode;

  String? pincode;

  SignupRequest({
    this.fullName = "",
    this.email = "",
    this.mobile = "",
    this.gender = "",
    this.city = "",
    this.state = "",
    this.country = "",
    this.termsAndConditions = false,
    this.referrerCode = "",
    this.pincode = "",
  });

  SignupRequest.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    city = json['city'];
    state = json['state'];
    country = json['country'];

    termsAndConditions = json['terms_and_conditions'];

    referrerCode = json['referrerCode'];

    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;

    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;

    data['terms_and_conditions'] = this.termsAndConditions;
    data['referrerCode'] = this.referrerCode;
    data['pincode'] = this.pincode;
    return data;
  }
}
