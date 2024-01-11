import 'app.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkService(), permanent: true);
    Get.put(NotificationServices(), permanent: true);
    Get.put(AuthRepository(), permanent: true);
    Get.put(ProfileRepository(), permanent: true);

    Get.put(WalletRepository(), permanent: true);
    Get.put(PoojaServicesRespository(), permanent: true);
    Get.put(MandirRespository(), permanent: true);

    Get.put(DashboardRepository(), permanent: true);
    Get.put(AppController(), permanent: true);
    Get.put(AuthController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(ProfileController(), permanent: true);
    Get.put(WalletController(), permanent: true);
    Get.put(PoojaServicesController(), permanent: true);
    Get.put(MandirController(), permanent: true);
  }
}
