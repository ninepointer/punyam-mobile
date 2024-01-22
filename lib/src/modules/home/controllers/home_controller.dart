import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';
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

  final homeaddressTextController = TextEditingController();
  final homeNameTextController = TextEditingController();
  final homelandmarkTextController = TextEditingController();
  final homelocalityTextController = TextEditingController();
  final homehouseNoTextController = TextEditingController();
  final homefloorNoTextController = TextEditingController();
  final homeContactNoTextController = TextEditingController();
  final homePinCodeTextController = TextEditingController();
  final homeTagTextController = TextEditingController();

  final selectedIndex = 0.obs;
  final userSaveAddress = GetUserSaveAddressData().obs;

  final userSaveAddressData = <GetSaveAddressDetails>[].obs;
  final dashboardCarouselList = <DashboardCarousel>[].obs;
  final carouselListforHome = <DashboardCarousel>[].obs;
  final homepagePoojaList = <PoojaCategoryData>[].obs;
  final locationByLatandLong = <Results>[].obs;
  final locationBy = GetLocationByLatLongList().obs;
  final addressComponent = <AddressComponents>[].obs;
  final userLoacationLong = "".obs;
  final userLoacationLatitude = "".obs;
  final mapLatitude = "".obs;
  final mapLongitude = "".obs;

  String selectedCity = 'Noida'; // Set the default city
  String selectedState = 'Uttar Pradesh';
  void loadUserDetails() {
    userDetails(AppStorage.getUserDetails());
    loadData();

    // Get.find<MandirController>().loadData();
    // Get.find<ContestController>().getFeaturedContest();
    // Get.find<ContestController>().getReadSetting();
  }

  Future loadData() async {
    userDetails.value = AppStorage.getUserDetails();
    await getDashboardCarousel();
    await getPoojaCatagoryDetails();
    await getUserSaveAddressDetails();
  }

  // getUserCurrentLocation() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     log("Permission Denied");
  //     LocationPermission ask = await Geolocator.requestPermission();
  //     final latitude = AppStorage.locationLatitude();
  //     final longitude = AppStorage.locationLongitude();
  //     //  longitude.toString(), latitude.toString()
  //     if(latitude!=null && longitude!=null){
  //       await getUserLoactionByLatAndLongDetails(
  //           latitude.toString(), longitude.toString());
  //       Get.find<MandirController>().getNearByMandirsDetails();
  //     }
  //   } else {
  //     Position currentPosition = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //     log("Longitude ${currentPosition.longitude}");
  //     log("Latitude ${currentPosition.latitude}");
  //     userLoacationLong(currentPosition.longitude.toString());
  //     userLoacationLatitude(currentPosition.latitude.toString());
  //     await AppStorage.setUserLocation(currentPosition.latitude.toString(),
  //         currentPosition.longitude.toString());
  //     await getUserLoactionByLatAndLongDetails(
  //         userLoacationLatitude.toString(), userLoacationLong.toString());
  //     Get.find<MandirController>().getNearByMandirsDetails();
  //   }
  // }
  getUserCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    // Request permission if it's denied but not denied forever.
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      try {
        // Try to fetch current position.
        Position currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        log("Longitude: ${currentPosition.longitude}");
        log("Latitude: ${currentPosition.latitude}");
        await AppStorage.setUserLocation(currentPosition.latitude.toString(),
            currentPosition.longitude.toString());
        await getUserLoactionByLatAndLongDetails(
            currentPosition.latitude.toString(),
            currentPosition.longitude.toString());
      } catch (e) {
        // Fallback to saved location if fetching current position fails.
        final latitude = AppStorage.locationLatitude();
        final longitude = AppStorage.locationLongitude();
        if (latitude != null && longitude != null) {
          log("Using saved location: Latitude $latitude, Longitude $longitude");
          await getUserLoactionByLatAndLongDetails(
              latitude.toString(), longitude.toString());
        } else {
          log("Error fetching location: $e");
          // Handle the case where neither current nor saved location is available.
        }
      }
    } else {
      // Permission is denied, use saved location if available.
      final latitude = AppStorage.locationLatitude();
      final longitude = AppStorage.locationLongitude();
      if (latitude != null && longitude != null) {
        log("Using saved location: Latitude $latitude, Longitude $longitude");
        await getUserLoactionByLatAndLongDetails(
            latitude.toString(), longitude.toString());
      } else {
        log("Location permission denied and no saved location available.");
      }
    }

    // Proceed with fetching nearby mandirs details.
    Get.find<MandirController>().getNearByMandirsDetails();
    Get.find<MandirController>().getDhamTamplesByDistanceDetails();
    Get.find<MandirController>().getPopularTamplesByDistanceDetails();
  }

  getUserAddressLocation(latitude, longitude) async{
    try {  
    await getUserLoactionByLatAndLongDetails(
              latitude.toString(), longitude.toString());
    AppStorage.setUserLocation(latitude.toString(), longitude.toString());          
    } catch (e) {
      log('Error setting user location');
  }
      
    }
  void navigateToCarousel(String link) {
    // if (link == 'marginxs') {
    //   selectedIndex(3);

    // Get.find<MarginXController>().loadData();
    // Get.toNamed(AppRoutes.marginx);
    //
    if (link == 'pooja') {
      selectedIndex(2);
      Get.find<PoojaServicesController>().loadData();
    } else if (link == 'mandir') {
      selectedIndex(1);
      Get.find<MandirController>().loadData();
    } else if (link == 'store') {
      Get.find<StoreController>().loadData();
      Get.to(() => StoreView());
    }
    // else if (link == 'mandir') {
    //   selectedIndex(1);
    //   Get.find<MandirController>().loadData();
    // }

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

  Future getUserLoactionByLatAndLongDetails(
      String latitude, String longitude) async {
    try {
      final RepoResponse<GetLocationByLatAndLongResponse> response =
          await repository.getLocationByLongAndLat(latitude, longitude);
      if (response.data != null) {
        locationBy(response.data?.data);

        locationByLatandLong(locationBy.value.results ?? []);
        addressComponent(locationByLatandLong.first.addressComponents ?? []);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
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

  Future saveUserAddress() async {
    isLoading(true);
    Map<String, dynamic> data = {
      'address': "",
      "pincode": homePinCodeTextController.text,
      'city': selectedCity,
      'state': selectedState,
      'country': "india",
      'latitude': double.parse(mapLatitude.value),
      'longitude': double.parse(mapLongitude.value),
      'tag': homeTagTextController.text,
      'contact_name': homeNameTextController.text,
      'contact_number': homeContactNoTextController.text,
      'landmark': homelandmarkTextController.text,
      'locality': homelocalityTextController.text,
      'floor': homefloorNoTextController.text,
      'house_or_flat_no': homehouseNoTextController.text,
    };
    try {
      final RepoResponse<SaveAddressResponse> response =
          await repository.addUserAddress(data);

      if (response.data?.status == "success") {
        SnackbarHelper.showSnackbar(response.data?.message);
        clearDataField();
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log('Save: ${e.toString()}');
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future<void> getUserSaveAddressDetails() async {
    try {
      final RepoResponse<GetSaveAddressResponse> response =
          await repository.getaddUserAddress();
      if (response.data != null) {
        userSaveAddress(response.data?.data);
        userSaveAddressData(userSaveAddress.value.addressDetails ?? []);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future removeUserAddress(String id) async {
    isLoading(true);

    try {
      final RepoResponse<GetSaveAddressResponse> response =
          await repository.removeUserAddress(id);
      if (response.data != null) {
        userSaveAddress(response.data?.data);
      }
      if (response.data?.status == "success") {
        SnackbarHelper.showSnackbar(response.data?.message);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log('Save: ${e.toString()}');
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  void clearDataField() {
    homePinCodeTextController.clear();
    homeNameTextController.clear();
    selectedCity = "Noida";
    selectedState = "Uttar Pradesh";
    homeTagTextController.clear();
    homeContactNoTextController.clear();
    homeContactNoTextController.clear();
    homelandmarkTextController.clear();
    homelocalityTextController.clear();
    homefloorNoTextController.clear();
    homehouseNoTextController.clear();
  }

  Future editUserAddress(String id) async {
    isLoading(true);
    Map<String, dynamic> data = {
      'address': "",
      "pincode": homePinCodeTextController.text,
      'city': selectedCity,
      'state': selectedState,
      'country': "india",
      'latitude': double.parse(mapLatitude.value),
      'longitude': double.parse(mapLongitude.value),
      'tag': homeTagTextController.text,
      'contact_name': homeContactNoTextController.text,
      'contact_number': homeContactNoTextController.text,
      'landmark': homelandmarkTextController.text,
      'locality': homelocalityTextController.text,
      'floor': homefloorNoTextController.text,
      'house_or_flat_no': homehouseNoTextController.text,
    };
    try {
      final RepoResponse<SaveAddressResponse> response =
          await repository.editUserAddress(id, data);

      if (response.data?.status == "success") {
        SnackbarHelper.showSnackbar(response.data?.message);
        clearDataField();
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log('Save: ${e.toString()}');
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }
}
