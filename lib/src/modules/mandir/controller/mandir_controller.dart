import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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

  final isSearchMandirLoading = false.obs;
  bool get isSearchMandirLoadingStatus => isSearchMandirLoading.value;

  final dashboardCarouselList = <DashboardCarousel>[].obs;

  final carouselListforMandir = <DashboardCarousel>[].obs;

  final searchTextController = TextEditingController();

  final allTempleListDetails = <AllMandirData>[].obs;
  final mandirByDevitaNameListDetails = <AllMandirData>[].obs;
  final popularTempleListDetails = <AllMandirData>[].obs;
  final dhamTempleListDetails = <AllMandirData>[].obs;
  final deviDevtaListDetails = <DeviDevtaList>[].obs;
  final nearbyMandirs = <TempleNearByMeList>[].obs;
  final mandirSearchByStringList = <AllMandirData>[].obs;

  bool isFavorite = false;
  late final Function(bool) onFavoriteChanged = (isFavorite) {
    this.isFavorite = isFavorite;
  };

  Future loadData() async {
    await getCarousel();
    // await getNearByMandirsDetails();
    await getAllTemplesDetails();
    await getPopularTamplesDetails();
    await getDhamTemplesDetails();
    await getAllDeiDevtaListDetails();
  }

  void navigateToCarousel(String link) {}

  Future<void> getNavigateToGoogleMap(num endLat, num endLng) async {
    final latitude = AppStorage.locationLatitude();
    final longitude = AppStorage.locationLongitude();

    if (latitude != null && longitude != null) {
      await _launchMapsUrl(
          latitude.toString(), longitude.toString(), endLat, endLng);
    } else {
      await _launchMapsUrlWithDestinationOnly(endLat, endLng);
    }
  }

  Future<void> _launchMapsUrl(
      String startLat, String startLng, num endLat, num endLng) async {
    String googleMapsUrl =
        "https://www.google.com/maps/dir/?api=1&origin=$startLat,$startLng&destination=$endLat,$endLng&travelmode=driving";

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  Future<void> _launchMapsUrlWithDestinationOnly(num endLat, num endLng) async {
    String googleMapsUrl =
        "https://www.google.com/maps/dir/?api=1&destination=$endLat,$endLng&travelmode=driving";

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  Future getCarousel() async {
    isLoading(true);
    try {
      final RepoResponse<DashboardCarouselResponse> response =
          await repository.getCarousel();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          carouselListforMandir.clear();
          dashboardCarouselList(response.data?.data ?? []);
          for (DashboardCarousel carousel in dashboardCarouselList) {
            if (carousel.position == "Mandir") {
              carouselListforMandir.addAll([carousel]);
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

  Future<void> getTempleByGodNameDetails(String id) async {
    try {
      final RepoResponse<AllMandirResponse> response =
          await repository.getMandirBygodName(id);
      if (response.data != null) {
        mandirByDevitaNameListDetails(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  // Future<void> getPopularTamplesDetails() async {
  //   try {
  //     final RepoResponse<AllMandirResponse> response =
  //         await repository.getPopularTemples();
  //     if (response.data != null) {
  //       popularTempleListDetails(response.data?.data);
  //     } else {
  //       SnackbarHelper.showSnackbar(response.error?.message);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
  //   }
  // }
  Future<void> getPopularTamplesDetails() async {
    final latitude = AppStorage.locationLatitude() ?? '28.4744';
    final longitude = AppStorage.locationLongitude() ?? '77.5040';
    try {
      final RepoResponse<AllMandirResponse> response = await repository
          .getPopularTemples(latitude.toString(), longitude.toString());
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

  Future<void> getNearByMandirsDetails() async {
    final latitude = AppStorage.locationLatitude() ?? '28.4744';
    final longitude = AppStorage.locationLongitude() ?? '77.5040';
    try {
      final RepoResponse<TempleNearMeResponse> response = await repository
          .getNearByMandirs(latitude.toString(), longitude.toString());
      if (response.data != null) {
        nearbyMandirs(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future<void> getAllDeiDevtaListDetails() async {
    try {
      final RepoResponse<DevataListResponse> response =
          await repository.getAllDeviDevta();
      if (response.data != null) {
        deviDevtaListDetails(response.data?.data);
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

  void gotoSearchMandir() {
    searchTextController.text = 'Search ';
    searchMandirByStringDetails(searchTextController.text);
    Get.toNamed(AppRoutes.virtualSearchSymbol);
  }

  Future searchMandirByStringDetails(String? value,
      {bool showShimmer = true}) async {
    isSearchMandirLoading(true);
    try {
      final RepoResponse<AllMandirResponse> response =
          await repository.searchMandirByString(value);
      if (response.data != null) {
        if (response.data?.data! != null) {
          mandirSearchByStringList.clear();
          mandirSearchByStringList(response.data?.data ?? []);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isSearchMandirLoading(false);
  }
}
