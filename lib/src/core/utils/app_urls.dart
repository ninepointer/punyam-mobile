import '../../../main.dart';

class AppUrls {
  static const String baseURL =
      isProd ? 'https://punyam.app' : "http://3.6.178.87";
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

  static const String getDhamMandirs = "$apiURL/mandir/user/dham";

  static const String addtoFavirouteMandirs =
      "$apiURL/mandir/user/addfavourite";
  static const String removetoFavirouteMandirs =
      "$apiURL/mandir/user/unfavourite";

  static const String increasePoojaCount = "$apiURL/pooja/user/addCount";
  static const String poojalistHomepage = "$apiURL/pooja/user/trending";
  static const String godList = "$apiURL/devta/user";
  static String mandirListBygod(
          String? id, String? lat, String? long, String? search) =>
      "$apiURL/mandir/user/bydevta?devtaId=$id&lat=$lat&long=$long&search=$search";
  static String nearbyMandirs(String? lat, String? long, String? search) =>
      "$apiURL/mandir/user/bydistance?lat=$lat&long=$long&search=$search";
  static String searchMandir = "$apiURL/mandir/user/bysearch";
  static const String googleLogin = "$apiURL/verifyfirebaselogintoken";
  static String getLocationByLongLat(String? lat, String? long) =>
      "$apiURL/location/currentplace?lat=$lat&long=$long";

  static String getPopularMandirs(String? lat, String? long) =>
      "$apiURL/mandir/user/popular?lat=$lat&long=$long";

  // static String getAllMandirs(String? search) =>
  //     "$apiURL/mandir/user/bysearch?search=$search";
  static String getDhamByDistanceMandirs(
          String? lat, String? long, String? search) =>
      "$apiURL/mandir/user/newdham?lat=$lat&long=$long&search=$search";
  static String getPopularMandirByDistanceMandirs(
          String? lat, String? long, String? search) =>
      "$apiURL/mandir/user/newpopular?lat=$lat&long=$long&search=$search";

  static const String addUserAddressUrl = "$apiURL/user/address";
  static String editUserAddressUrl(String? id) => "$apiURL/user/address/$id";
  static String removeUserAddressUrl(String? id) =>
      "$apiURL/user/removeaddress/$id";

  static const String getAllUserBooking = "$apiURL/booking/user";

  static String getTrandingMandirs(String? lat, String? long) =>
      "$apiURL/mandir/user/trending?lat=$lat&long=$long";

  static String getFavirouteMandirs(String? lat, String? long) =>
      "$apiURL/mandir/user/myfavourite?lat=$lat&long=$long";
}
