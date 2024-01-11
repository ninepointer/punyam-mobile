class VerifySignupRequest {
  String? fullName;
  String? email;
  String? mobile;
  String? mobileOtp;
  String? referrerCode;

  VerifySignupRequest({
    this.fullName,
    this.email,
    this.mobile,
    this.mobileOtp,
    this.referrerCode,
  });

  VerifySignupRequest.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    mobile = json['mobile'];
    mobileOtp = json['mobile_otp'];
    referrerCode = json['referrerCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['mobile_otp'] = this.mobileOtp;
    data['referrerCode'] = this.referrerCode;
    return data;
  }
}
