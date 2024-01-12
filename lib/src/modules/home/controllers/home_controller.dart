import 'package:flutter/material.dart';

import '../../../app/app.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() => Get.put(HomeController());
}

class HomeController extends BaseController<DashboardRepository> {
  final userDetails = LoginDetailsResponse().obs;
  LoginDetailsResponse get userDetailsData => userDetails.value;

  final isLoading = false.obs;

  bool get isLoadingStatus => isLoading.value;

  final selectedIndex = 0.obs;

  final dashboardCarouselList = <DashboardCarousel>[].obs;

  void loadUserDetails() {
    userDetails(AppStorage.getUserDetails());
    loadData();

    // Get.find<WalletController>().getWalletTransactionsList();
    // Get.find<ContestController>().getFeaturedContest();
    // Get.find<ContestController>().getReadSetting();
  }

  Future loadData() async {
    userDetails.value = AppStorage.getUserDetails();
    // await getStockIndexInstrumentsList();
    // await getDashboardReturnSummary();
    await getDashboardCarousel();
    // await getDashboard(selectedTradeType, selectedTimeFrame);
    // await liveIndexDetails();
    // socketIndexConnection();
  }

  void navigateToCarousel(String link) {
    // if (link == 'marginxs') {
    //   selectedIndex(3);

    //   // Get.find<MarginXController>().loadData();
    //   // Get.toNamed(AppRoutes.marginx);
    //   // Get.to(() => MarginXView());
    // } else if (link == 'testzone') {
    //   selectedIndex(4);
    //   Get.find<ContestController>().loadData();
    // } else if (link == 'tenxtrading') {
    //   selectedIndex(2);
    //   Get.find<TenxTradingController>().loadData();
    // } else if (link == 'referrals') {
    //   Get.find<ReferralsController>().loadData();
    //   Get.toNamed(AppRoutes.referrals);
    // } else if (link == 'wallet') {
    //   Get.find<WalletController>().loadData();
    //   Get.toNamed(AppRoutes.wallet);
    // } else if (link == 'market') {
    //   selectedIndex(1);
    //   Get.find<VirtualTradingController>().loadData();
    // } else if (link == 'toptestzoneportfolios') {
    //   // selectedIndex(3);
    //   Get.find<ContestProfileController>().loadData();

    //   Get.to(() => ContestTopPerformerCard());
    // }
  }

  Color getValueColor(dynamic value) {
    if (value != null) {
      if (value is String) {
        if (value.contains('-')) {
          return AppColors.danger;
        } else if (value == '0') {
          return AppColors.success;
        }
      } else {
        num number = value is int || value is double ? value : num.parse(value);
        if (number > 0) {
          return AppColors.success;
        } else if (number < 0) {
          return AppColors.danger;
        } else if (number == 0) {
          return AppColors.success;
        }
      }
    }
    return AppColors.grey;
  }

  Future getDashboardCarousel() async {
    isLoading(true);
    try {
      final RepoResponse<DashboardCarouselResponse> response =
          await repository.getDashboardCarousel();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          dashboardCarouselList(response.data?.data ?? []);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }
}
