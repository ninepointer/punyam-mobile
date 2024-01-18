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

  final popularMandirsearchTextController = TextEditingController();
  final dhamMandirsearchTextController = TextEditingController();
  final allMandirsearchTextController = TextEditingController();

  final allTempleListDetails = <AllMandirData>[].obs;
  final mandirByDevitaNameListDetails = <AllMandirData>[].obs;
  final popularTempleListDetails = <AllMandirData>[].obs;
  final popularTempleListByDistanceDetails = <TempleNearByMeList>[].obs;
  final dhamTempleListDetails = <AllMandirData>[].obs;
  final dhamTempleListByDistanceDetails = <TempleNearByMeList>[].obs;
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
    // await getAllTemplesDetails();
    await getPopularTamplesDetails();
    await getDhamTemplesDetails();
    await getAllDeiDevtaListDetails();
    await getDhamTamplesByDistanceDetails();
    await getPopularTamplesByDistanceDetails();
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
        popularTempleListByDistanceDetails(response.data?.data);
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
        dhamTempleListByDistanceDetails(response.data?.data);
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
      // await getAllTemplesDetails();
      SnackbarHelper.showSnackbar(
          isFavorite ? 'Added to favorites' : 'Removed from favorites');
    } catch (e) {
      print(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isMandirLoading(false);
  }
}
