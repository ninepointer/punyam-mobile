import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../base/base.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';

class MandirBinding implements Bindings {
  @override
  void dependencies() => Get.put(MandirController());
}

class MandirController extends BaseController<MandirRespository> {
  final isLoading = false.obs;
  bool get isLoadingStatus => isLoading.value;

  final isMandirLoading = false.obs;
  bool get isMandirLoadingStatus => isMandirLoading.value;

  final dashboardCarouselList = <DashboardCarousel>[].obs;

  final searchTextController = TextEditingController();

  final allTempleListDetails = <AllMandirData>[].obs;
  final popularTempleListDetails = <AllMandirData>[].obs;
  final dhamTempleListDetails = <AllMandirData>[].obs;

  bool isFavorite = false;
  late final Function(bool) onFavoriteChanged = (isFavorite) {
    this.isFavorite = isFavorite;
  };

  Future loadData() async {
    await getCarousel();
    await getAllTemplesDetails();
    await getPopularTamplesDetails();
    await getDhamTemplesDetails();
  }

  void navigateToCarousel(String link) {}

  Future getCarousel() async {
    isLoading(true);
    try {
      final RepoResponse<DashboardCarouselResponse> response =
          await repository.getCarousel();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          dashboardCarouselList(response.data?.data ?? []);
          print("dash${dashboardCarouselList.length}");
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future<void> getAllTemplesDetails() async {
    try {
      final RepoResponse<AllMandirResponse> response =
          await repository.getAllTemples();
      if (response.data != null) {
        allTempleListDetails(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future<void> getPopularTamplesDetails() async {
    try {
      final RepoResponse<AllMandirResponse> response =
          await repository.getPopularTemples();
      if (response.data != null) {
        popularTempleListDetails(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future<void> getDhamTemplesDetails() async {
    try {
      final RepoResponse<AllMandirResponse> response =
          await repository.getDhamTemples();
      if (response.data != null) {
        dhamTempleListDetails(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future addFaviroutesMandir(String? mandirid) async {
    isMandirLoading(true);
    try {
      await repository.addToFavirouteMandir(mandirid ?? '');
      await getAllTemplesDetails();
      SnackbarHelper.showSnackbar(
          isFavorite ? 'Add to favorites' : 'Remove from favorites');
    } catch (e) {
      print(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isMandirLoading(false);
  }
}
