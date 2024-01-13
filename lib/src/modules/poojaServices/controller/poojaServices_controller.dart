import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../base/base.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

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

  final selectedPoojaById = SelectedPoojaByIdData().obs;
  final selectedTabIndex = 0.obs;

  String? bookingPoojaId = '';
  String? bookingTierId = '';
  String? bookingAmount = '';

  String selectedCity = 'Noida'; // Set the default city
  String selectedState = 'Uttar Pradesh';
  String country = 'India';

  final fullNameTextController = TextEditingController();
  final mobileNumberTextController = TextEditingController();
  final bookingDateTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final pinCodeTextController = TextEditingController();
  final selectedBookingDateTime = ''.obs;
  Future loadData() async {
    await getPoojaCatagoryDetails();
    await getCarousel();
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

        // Check if the selected time is between 10:00 PM and 5:00 AM
        if (pickedTime.hour >= 22 || pickedTime.hour < 5) {
          // Show a message that the service is not available during this time
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Service Not Available"),
                content: Text(
                    "This service is not available between 10:00 PM and 5:00 AM."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        } else {
          // Store the DateTime object in the desired format
          String formattedDateTime = selectedDateTime.toUtc().toIso8601String();
          selectedBookingDateTime(formattedDateTime);

          // Update the UI with the formatted date for display
          String displayDateTimeString =
              DateFormat("dd-MM-yyyy hh:mm a").format(selectedDateTime);
          bookingDateTextController.text = displayDateTimeString;
        }
      }
    }
  }

  void updateStateBasedOnCity(String city) {
    switch (city) {
      case "Noida":
        selectedState = "Uttar Pradesh";
        break;
      case "Delhi":
        selectedState = "Delhi";
        break;
      case "Gurgaon":
        selectedState = "Haryana";
        break;
      default:
        selectedState = "";
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

        poojaCatagoryGenralPooja.clear();
        poojaCatagoryPaath.clear();
        poojaCatagoryJaap.clear();

        for (PoojaCategoryData poojacatagory in poojaCatagoriesList) {
          if (poojacatagory.subCategory == "General Pooja") {
            poojaCatagoryGenralPooja.addAll([poojacatagory]);
          }
          if (poojacatagory.subCategory == "Paath") {
            poojaCatagoryPaath.addAll([poojacatagory]);
            print("poojaCatagoryPaath ${poojaCatagoryPaath.toJson()}");
          }
          if (poojacatagory.subCategory == "Jaap") {
            poojaCatagoryJaap.addAll([poojacatagory]);
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

  Future<void> getindividualPoojaByIdDetails(String poojaId) async {
    try {
      final RepoResponse<SelectPoojaByIdResponse> response =
          await repository.getPoojaServiceByid(poojaId);
      if (response.data != null) {
        selectedPoojaById(response.data?.data);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future getUserBookingDetails() async {
    isLoading(true);
    Map<String, dynamic> data = {
      'full_name': fullNameTextController.text,
      "mobile": mobileNumberTextController.text,
      'booking_date': selectedBookingDateTime.value,
      'address': addressTextController.text,
      'city': selectedCity,
      'state': selectedState,
      'country': country,
      'booking_amount': bookingAmount,
      'poojaId': bookingPoojaId,
      'tierId': bookingTierId,
    };
    try {
      final RepoResponse<BookingConfirmationResponse> response =
          await repository.getConfirmationBooking(data);
      if (response.data != null) {
        await Get.find<AuthController>().getUserDetails(navigate: false);
        loadData();
        if (response.data?.status == "success") {
          SnackbarHelper.showSnackbar(response.data?.message);
        }
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
