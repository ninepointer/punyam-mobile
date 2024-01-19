import 'package:get/route_manager.dart';

import '../../modules/modules.dart';
import 'routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoarding,
      page: () => OnBoardingView(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => SigninView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.profileDetails,
      page: () => ProfileDetailsView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.bankDetails,
      page: () => BankDetailsView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.kycDetails,
      page: () => KycDetailsView(),
      // binding: BankBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.wallet,
    //   page: () => WalletView(),
    //   binding: WalletBinding(),
    // ),
    GetPage(
      name: AppRoutes.poojaServices,
      page: () => PoojaServicesView(),
      binding: PoojaServicesBinding(),
    ),
    GetPage(
      name: AppRoutes.mandir,
      page: () => MandirView(),
      binding: MandirBinding(),
    ),
    GetPage(
      name: AppRoutes.popularMandir,
      page: () => PopularMandirView(),
      binding: MandirBinding(),
    ),
    GetPage(
      name: AppRoutes.location,
      page: () => LocationView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.bookingOrders,
      page: () => BookingOrderView(),
      binding: BookingBinding(),
    ),
  ];
}
