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
  final carouselListforPooja = <DashboardCarousel>[].obs;
  final poojaCatagoryGenralPooja = <PoojaCategoryData>[].obs;
  final poojaCatagoryPaath = <PoojaCategoryData>[].obs;
  final poojaCatagoryJaap = <PoojaCategoryData>[].obs;
  final poojaCatagoryFestivalPooja = <PoojaCategoryData>[].obs;
  final poojaCatagoriesList = <PoojaCategoryData>[].obs;

  final selectedPoojaById = SelectedPoojaByIdData().obs;

  var userBookingData = GetSaveAddressDetails().obs;

  // var userBookingAddressData = <GetSaveAddressDetails>[].obs;

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
  final bookingAddressTextController = TextEditingController();
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

  // void showDateTimePicker(BuildContext context) async {
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2300),
  //   );

  //   if (pickedDate != null) {
  //     String formattedDateTime = pickedDate.toUtc().toIso8601String();
  //     selectedBookingDateTime(formattedDateTime);
  //     String displayDateString = DateFormat("dd-MM-yyyy").format(pickedDate);
  //     bookingDateTextController.text = displayDateString;
  //   }
  // }

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
          carouselListforPooja.clear();
          dashboardCarouselList(response.data?.data ?? []);
          for (DashboardCarousel carousel in dashboardCarouselList) {
            if (carousel.position == "Pooja") {
              carouselListforPooja.addAll([carousel]);
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
          await repository.getPoojaCatagory();
      if (response.data != null) {
        poojaCatagoriesList(response.data?.data ?? []);

        poojaCatagoryGenralPooja.clear();
        poojaCatagoryPaath.clear();
        poojaCatagoryJaap.clear();
        poojaCatagoryFestivalPooja.clear();

        for (PoojaCategoryData poojacatagory in poojaCatagoriesList) {
          if (poojacatagory.subCategory == "General Pooja") {
            poojaCatagoryGenralPooja.addAll([poojacatagory]);
          }
          if (poojacatagory.subCategory == "Paath") {
            poojaCatagoryPaath.addAll([poojacatagory]);
          }
          if (poojacatagory.subCategory == "Jaap") {
            poojaCatagoryJaap.addAll([poojacatagory]);
          }
          if (poojacatagory.subCategory == "Festival Pooja") {
            poojaCatagoryFestivalPooja.addAll([poojacatagory]);
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

  Future increasePoojaCountDetails(String? poojaId) async {
    try {
      await repository.increasePoojaCount(poojaId ?? '');
      await getPoojaCatagoryDetails();
      // SnackbarHelper.showSnackbar("Add ${poojaId} pooja Successfully");
    } catch (e) {
      print(e.toString());
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future getUserBookingDetails() async {
    isLoading(true);
    BookingConfirmationRequest data = BookingConfirmationRequest(
      address: "",
      pincode: userBookingData.value.pincode,
      city: userBookingData.value.city,
      state: userBookingData.value.state,
      country: "india",
      latitude: userBookingData.value.location!.coordinates!.first,
      longitude: userBookingData.value.location!.coordinates!.last,
      contactName: userBookingData.value.contactName,
      contactNumber: userBookingData.value.contactNumber,
      landmark: userBookingData.value.landmark,
      locality: userBookingData.value.locality,
      floor: userBookingData.value.floor,
      houseOrFlatNo: userBookingData.value.houseOrFlatNo,
      fullName: userBookingData.value.contactName,
      mobile: userBookingData.value.contactNumber,
      bookingAmount: bookingAmount,
      bookingDate: selectedBookingDateTime.value,
      poojaId: bookingPoojaId,
      tierId: bookingTierId,
    );
    try {
      final RepoResponse<GenericResponse> response =
          await repository.getConfirmationBooking(data.toJson());

      if (response.data != null) {
        await Get.find<AuthController>().getUserDetails(navigate: false);
        loadData();
        if (response.data?.status == "success") {
          // SnackbarHelper.showSnackbar(response.data?.message);
          Get.to(() => BookingSuccessPage(
                bookingdate: bookingDateTextController.text,
                bookingAddress: bookingAddressTextController.text,
                paymentMethod: "Cash On Delivery",
              ));
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
