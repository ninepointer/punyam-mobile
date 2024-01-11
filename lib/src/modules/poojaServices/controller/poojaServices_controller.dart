import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../base/base.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';

class PoojaServicesBinding implements Bindings {
  @override
  void dependencies() => Get.put(PoojaServicesController());
}

class PoojaServicesController extends BaseController<PoojaServicesRespository> {
  final isLoading = false.obs;

  bool get isLoadingStatus => isLoading.value;
  final isBookingLoading = false.obs;
  bool get isProfileLoadingStatus => isBookingLoading.value;
  final dashboardCarouselList = <DashboardCarousel>[].obs;
  final poojaCatagoryGenralPooja = <PoojaCategoryData>[].obs;
  final poojaCatagoryPaath = <PoojaCategoryData>[].obs;
  final poojaCatagoryJaap = <PoojaCategoryData>[].obs;
  final poojaCatagoriesList = <PoojaCategoryData>[].obs;
  final selectedTabIndex = 0.obs;

  final fullNameTextController = TextEditingController();
  final mobileNumberTextController = TextEditingController();
  final bookingDateTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final selectedBookingDateTime = ''.obs;
  Future loadData() async {
    await getPoojaCatagoryDetails();
    // await getCarousel();
  }

  void showDateTimePicker(BuildContext context,
      {bool isStartDate = true}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2300),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        String dateTimeString =
            DateFormat("dd-MM-yyyy hh:mm a").format(selectedDateTime);
        bookingDateTextController.text = dateTimeString;
        selectedBookingDateTime(selectedDateTime.toString());
      }
    }
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

  Future getPoojaCatagoryDetails() async {
    try {
      final RepoResponse<PoojaCategoryResponse> response =
          await repository.getPoojaCatagory();
      if (response.data != null) {
        poojaCatagoriesList(response.data?.data ?? []);
        for (PoojaCategoryData poojacatagory in poojaCatagoriesList) {
          if (poojacatagory.subCategory == "General Pooja") {
            poojaCatagoryGenralPooja.add(poojacatagory);
          }
          if (poojacatagory.subCategory == "Paath") {
            poojaCatagoryPaath.add(poojacatagory);
            print("poojaCatagoryPaath ${poojaCatagoryPaath.toJson()}");
          }
          if (poojacatagory.subCategory == "Jaap") {
            poojaCatagoryJaap.add(poojacatagory);
          }
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }
}
