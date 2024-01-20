import '../../app/app.dart';

class DeepLinkingServices {
  static void handelLinkRouting(Uri uri) {
    final homeController = Get.find<HomeController>();
    if (uri.path.contains('/market')) {
      homeController.selectedIndex(1);
    }

    if (uri.path.contains('/testzone')) {
      homeController.selectedIndex(4);
    }

    if (uri.path.contains('/profile')) {
      Get.toNamed(AppRoutes.profile);
      Get.find<ProfileController>().loadData();
    }
    if (uri.path.contains('/wallet')) {
      Get.toNamed(AppRoutes.wallet);
      Get.find<WalletController>().loadData();
    }

    if (uri.path.contains('/faqs')) {
      Get.toNamed(AppRoutes.faq);
    }
  }
}
