import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
  final carouselListforHome = <DashboardCarousel>[].obs;
  final homepagePoojaList = <PoojaCategoryData>[].obs;
  final userLoacationLong = "".obs;
  final userLoacationLatitude = "".obs;

  void loadUserDetails() {
    userDetails(AppStorage.getUserDetails());
    loadData();

    // Get.find<WalletController>().getWalletTransactionsList();
    // Get.find<ContestController>().getFeaturedContest();
    // Get.find<ContestController>().getReadSetting();
  }

  Future loadData() async {
    userDetails.value = AppStorage.getUserDetails();
    await getDashboardCarousel();
    await getPoojaCatagoryDetails();
  }

  getUserCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Permission Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      log("Longitude ${currentPosition.longitude}");
      log("Latitude ${currentPosition.latitude}");
      await AppStorage.setUserLocation(currentPosition.latitude.toString(),
          currentPosition.longitude.toString());
      userLoacationLong(currentPosition.longitude.toString());
      userLoacationLatitude(currentPosition.latitude.toString());
    }
  }

  void navigateToCarousel(String link) {
    if (link == 'marginxs') {
      selectedIndex(3);

      // Get.find<MarginXController>().loadData();
      // Get.toNamed(AppRoutes.marginx);
      // Get.to(() => MarginXView());
    } else if (link == 'event') {
      selectedIndex(4);
      Get.find<PoojaServicesController>().loadData();
    } else if (link == 'mandir') {
      selectedIndex(2);
      Get.find<MandirController>().loadData();
    }
    //  else if (link == 'referrals') {
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
          carouselListforHome.clear();
          dashboardCarouselList(response.data?.data ?? []);
          for (DashboardCarousel carousel in dashboardCarouselList) {
            if (carousel.position == "Home") {
              carouselListforHome.addAll([carousel]);
            }
          }
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future getPoojaCatagoryDetails() async {
    try {
      final RepoResponse<PoojaCategoryResponse> response =
          await repository.getHomePagePoojaList();
      if (response.data != null) {
        homepagePoojaList(response.data?.data ?? []);

        // poojaCatagoryGenralPooja.clear();
        // poojaCatagoryPaath.clear();
        // poojaCatagoryJaap.clear();

        // for (PoojaCategoryData poojacatagory in poojaCatagoriesList) {
        //   if (poojacatagory.subCategory == "General Pooja") {
        //     poojaCatagoryGenralPooja.addAll([poojacatagory]);
        //   }
        //   if (poojacatagory.subCategory == "Paath") {
        //     poojaCatagoryPaath.addAll([poojacatagory]);
        //     print("poojaCatagoryPaath ${poojaCatagoryPaath.toJson()}");
        //   }
        //   if (poojacatagory.subCategory == "Jaap") {
        //     poojaCatagoryJaap.addAll([poojacatagory]);
        //   }
        // }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }
}
