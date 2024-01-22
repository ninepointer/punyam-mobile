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
  final carouselListforDham = <DashboardCarousel>[].obs;
  final carouselListforPopular = <DashboardCarousel>[].obs;
  final popularMandirsearchTextController = TextEditingController();
  final dhamMandirsearchTextController = TextEditingController();
  final allMandirsearchTextController = TextEditingController();
  final mandirByDevtasearchTextController = TextEditingController();

  final allTempleListDetails = <AllMandirData>[].obs;
  final mandirByDevitaNameListDetails = <TempleNearByMeList>[].obs;
  final popularTempleListDetails = <AllMandirData>[].obs;
  final popularTempleListByDistanceDetails = <TempleNearByMeList>[].obs;
  final dhamTempleListDetails = <AllMandirData>[].obs;
  final dhamTempleListByDistanceDetails = <TempleNearByMeList>[].obs;
  final deviDevtaListDetails = <DeviDevtaList>[].obs;
  final nearbyMandirs = <TempleNearByMeList>[].obs;
  final nearbyMandirsSearch = <TempleNearByMeList>[].obs;
  final dhamTempleListByDistanceSearchDetails = <TempleNearByMeList>[].obs;
  final popularTempleListByDistanceSearchDetails = <TempleNearByMeList>[].obs;
  final mandirSearchByStringList = <AllMandirData>[].obs;
  final trandingNowMandirs = <TempleNearByMeList>[].obs;
  final myFaviroutesMandirs = <TempleNearByMeList>[].obs;

  final isFavorite = false.obs;

  @override
  void onClose() {
    allMandirsearchTextController.clear();
    nearbyMandirsSearch.clear();
    super.onClose();
  }

  // final currentPage = 0.obs;
  // final totalItems = 0.obs;
  // final itemsPerPage = 0.obs;
  // final isLoadingMore = false.obs;

  Future loadData() async {
    await getCarousel();
    await getPopularCarousel();
    await getDhamCarousel();
    // await getNearByMandirsDetails();
    // await getAllTemplesDetails();
    await getPopularTamplesDetails();
    await getDhamTemplesDetails();
    await getAllDeiDevtaListDetails();
    await getTrandingNowTamplesDetails();
    await getMyFaviroutesTamplesDetails();
    // await getDhamTamplesByDistanceDetails();
    // await getPopularTamplesByDistanceDetails();
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

  Future getDhamCarousel() async {
    isLoading(true);
    try {
      final RepoResponse<DashboardCarouselResponse> response =
          await repository.getDhamCarousel();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          carouselListforDham.clear();
          dashboardCarouselList(response.data?.data ?? []);
          for (DashboardCarousel carousel in dashboardCarouselList) {
            if (carousel.position == "Dham") {
              carouselListforDham.addAll([carousel]);
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

  Future getPopularCarousel() async {
    isLoading(true);
    try {
      final RepoResponse<DashboardCarouselResponse> response =
          await repository.getPopularMandirCarousel();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          carouselListforPopular.clear();
          dashboardCarouselList(response.data?.data ?? []);
          for (DashboardCarousel carousel in dashboardCarouselList) {
            if (carousel.position == "Popular") {
              carouselListforPopular.addAll([carousel]);
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

  // Future<void> getAllTemplesDetails({String? searchQuery}) async {
  //   try {
  //     final RepoResponse<AllMandirResponse> response =
  //         await repository.getAllTemples(searchQuery ?? '');
  //     if (response.data != null) {
  //       allTempleListDetails(response.data?.data);
  //     } else {
  //       SnackbarHelper.showSnackbar(response.error?.message);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
  //   }
  // }

  Future<void> getTempleByGodNameDetails(String id,
      {String? searchQuery}) async {
    final latitude = AppStorage.locationLatitude() ?? '28.4744';
    final longitude = AppStorage.locationLongitude() ?? '77.5040';
    try {
      final RepoResponse<TempleNearMeResponse> response =
          await repository.getMandirBygodName(
              id, latitude.toString(), longitude.toString(), searchQuery ?? '');
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

  Future<void> getMyFaviroutesTamplesDetails() async {
    final latitude = AppStorage.locationLatitude() ?? '28.4744';
    final longitude = AppStorage.locationLongitude() ?? '77.5040';
    try {
      final RepoResponse<TempleNearMeResponse> response = await repository
          .getAllfaviroutesMandirs(latitude.toString(), longitude.toString());
      if (response.data != null) {
        myFaviroutesMandirs(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future<void> getTrandingNowTamplesDetails() async {
    final latitude = AppStorage.locationLatitude() ?? '28.4744';
    final longitude = AppStorage.locationLongitude() ?? '77.5040';
    try {
      final RepoResponse<TempleNearMeResponse> response = await repository
          .getAllTrandingMandirs(latitude.toString(), longitude.toString());
      if (response.data != null) {
        trandingNowMandirs(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

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

  // Future<void> getPopularTamplesByDistanceDetails(String searchQuery) async {
  //   final latitude = AppStorage.locationLatitude() ?? '28.4744';
  //   final longitude = AppStorage.locationLongitude() ?? '77.5040';
  //   try {
  //     final RepoResponse<TempleNearMeResponse> response =
  //         await repository.getPopularTemplesByDistance(
  //             latitude.toString(), longitude.toString(),searchQuery);
  //     if (response.data != null) {
  //       popularTempleListByDistanceDetails(response.data?.data);
  //     } else {
  //       SnackbarHelper.showSnackbar(response.error?.message);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
  //   }
  // }
  Future<void> getPopularTamplesByDistanceDetails({String? searchQuery}) async {
    final latitude = AppStorage.locationLatitude() ?? '28.4744';
    final longitude = AppStorage.locationLongitude() ?? '77.5040';
    try {
      RepoResponse<TempleNearMeResponse> response;

      if (searchQuery != null && searchQuery.isNotEmpty) {
        response = await repository.getPopularTemplesBySearchByDistance(
            latitude.toString(), longitude.toString(), searchQuery);
      } else {
        response = await repository.getAllPopularTemplesByDistance(
            latitude.toString(), longitude.toString());
      }

      if (response.data != null) {
        if (searchQuery != null && searchQuery.isNotEmpty) {
          popularTempleListByDistanceSearchDetails(response.data?.data);
        } else {
          popularTempleListByDistanceDetails(response.data?.data);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future<void> getDhamTamplesByDistanceDetails({String? searchQuery}) async {
    final latitude = AppStorage.locationLatitude() ?? '28.4744';
    final longitude = AppStorage.locationLongitude() ?? '77.5040';
    try {
      RepoResponse<TempleNearMeResponse> response;

      if (searchQuery != null && searchQuery.isNotEmpty) {
        response = await repository.getDhamMandirBySearchByDistance(
            latitude.toString(), longitude.toString(), searchQuery);
      } else {
        response = await repository.getDhamMandirByDistance(
            latitude.toString(), longitude.toString());
      }

      if (response.data != null) {
        if (searchQuery != null && searchQuery.isNotEmpty) {
          dhamTempleListByDistanceSearchDetails(response.data?.data);
        } else {
          dhamTempleListByDistanceDetails(response.data?.data);
        }
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

  // Future<void> getNearByMandirsDetails() async {
  //   final latitude = AppStorage.locationLatitude() ?? '28.4744';
  //   final longitude = AppStorage.locationLongitude() ?? '77.5040';
  //   try {
  //     final RepoResponse<TempleNearMeResponse> response = await repository
  //         .getNearByMandirs(latitude.toString(), longitude.toString());
  //     if (response.data != null) {
  //       nearbyMandirs(response.data?.data);
  //     } else {
  //       SnackbarHelper.showSnackbar(response.error?.message);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
  //   }
  // }
  Future<void> getNearByMandirsDetails({String? searchQuery}) async {
    final latitude = AppStorage.locationLatitude() ?? '28.4744';
    final longitude = AppStorage.locationLongitude() ?? '77.5040';
    try {
      RepoResponse<TempleNearMeResponse> response;

      if (searchQuery != null && searchQuery.isNotEmpty) {
        response = await repository.getNearByMandirsBySearchByDistance(
            latitude.toString(), longitude.toString(), searchQuery);
      } else {
        response = await repository.getNearByMandirsByDistance(
            latitude.toString(), longitude.toString());
      }

      if (response.data != null) {
        if (searchQuery != null && searchQuery.isNotEmpty) {
          nearbyMandirsSearch(response.data?.data);
          print("uuu ${nearbyMandirsSearch}");
        } else {
          nearbyMandirs(response.data?.data);
        }
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

  Future<void> addFaviroutesMandir(String? mandirid) async {
    isMandirLoading(true);
    try {
      if (isFavorite.value) {
        await repository.removeToFavirouteMandir(mandirid ?? '');
        SnackbarHelper.showSnackbar('Removed from favorites');
      } else {
        await repository.addToFavirouteMandir(mandirid ?? '');
        SnackbarHelper.showSnackbar('Added to favorites');
      }

      // Toggle the favorite state
      isFavorite.value = !isFavorite.value;
      update(); // Trigger rebuild
    } catch (e) {
      print(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isMandirLoading(false);
  }
}
