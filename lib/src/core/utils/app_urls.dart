import '../../../main.dart';

class AppUrls {
  static const String baseURL =
      isProd ? 'https://punyam.app' : 'https://punyam.app';
  static const String apiURL = '$baseURL/api/v1';

  static const String referralWebUrl = 'https://www.stoxhero.com/?referral=';

  static const String paymentCallBackUrl =
      "https://stoxhero.com/api/v1/payment/callback";

  static const String appVersion = '$apiURL/mobileappversion';
  static const String defaultInviteCode = "$apiURL/campaign/defaultinvite";
  static const String makePayment = "$apiURL/payment/makepayment";
  static const String checkPaymentStatus = "$apiURL/payment/checkstatus";

  static const String addFcmToken = "$apiURL/addfcmtoken";

  static const String signup = "$apiURL/signup";
  static const String phoneLogin = "$apiURL/phonelogin";
  static const String verifyPhoneLogin = "$apiURL/verifyphonelogin";
  static const String verifyOtp = "$apiURL/verifyotp";
  static const String resendSigninOtp = "$apiURL/resendmobileotp";
  static const String resendSignupOtp = "$apiURL/resendotp";
  static const String loginDetails = "$apiURL/loginDetail";
  static const String updateUserDetails = "$apiURL/userdetail/me";
  static const String readSetting = "$apiURL/readsetting";

  static const String withdrawal = "$apiURL/withdrawals";
  static const String userWalletTransactions = "$apiURL/userwallet/my";
  static const String dashboardCarousel = "$apiURL/carousels/home";
  static const String myWithdrawals = "$apiURL/withdrawals/mywithdrawals";

  //
  static const String bookingConfirmation = "$apiURL/pooja/user/booking";
  static const String poojaCatagory = "$apiURL/pooja/user";

  static String individualPoojaById(String? poojaId) =>
      "$apiURL/pooja/user/$poojaId";
}
