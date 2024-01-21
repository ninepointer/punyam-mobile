import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/base.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() => Get.put(StoreController());
}

class StoreController extends BaseController<StoreRepository> {
  final isLoading = false.obs;
  bool get isLoadingStatus => isLoading.value;

  // final isMandirLoading = false.obs;
  // bool get isMandirLoadingStatus => isMandirLoading.value;

  // final isSearchMandirLoading = false.obs;
  // bool get isSearchMandirLoadingStatus => isSearchMandirLoading.value;

  final dashboardCarouselList = <DashboardCarousel>[].obs;

  final carouselListforMandir = <DashboardCarousel>[].obs;
  final searchTextController = TextEditingController();
  final isSearchCleared = false.obs;

  // final popularMandirsearchTextController = TextEditingController();
  // final dhamMandirsearchTextController = TextEditingController();
  // final allMandirsearchTextController = TextEditingController();
  // final mandirByDevtasearchTextController = TextEditingController();

  final isFavorite = false.obs;

  @override
  void onClose() {
    print("Hello");
   // allMandirsearchTextController.clear();
   
    super.onClose();
  }

  // final currentPage = 0.obs;
  // final totalItems = 0.obs;
  // final itemsPerPage = 0.obs;
  // final isLoadingMore = false.obs;

  Future loadData() async {
    await getDashboardCarousel();
  }
//all functions down here

  Future getDashboardCarousel() async {
    isLoading(true);
    try {
      final RepoResponse<DashboardCarouselResponse> response =
          await repository.getDashboardCarousel();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          dashboardCarouselList.clear();
          dashboardCarouselList(response.data?.data ?? []);
          for (DashboardCarousel carousel in dashboardCarouselList) {
            if (carousel.position == "Home") {
              dashboardCarouselList.addAll([carousel]);
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
}
