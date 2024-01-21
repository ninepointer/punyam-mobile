import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../app/app.dart';

class BookingBinding implements Bindings {
  @override
  void dependencies() => Get.put(HomeController());
}

class BookingController extends BaseController<BookingOrderRepository> {
  final isLoading = false.obs;
  bool get isLoadingStatus => isLoading.value;
  final userDetails = LoginDetailsResponse().obs;
  LoginDetailsResponse get userDetailsData => userDetails.value;

  final userAllBookingOrders = <BookingOrderData>[].obs;

  Future loadData() async {
    userDetails.value = AppStorage.getUserDetails();
    await getAllBookingOrdersDetails();
  }

  Future getAllBookingOrdersDetails() async {
    isLoading(true);
    try {
      final RepoResponse<GatAllBookingResponse> response =
          await repository.getAllBookingOrders();
      if (response.data != null) {
        userAllBookingOrders(response.data?.data ?? []);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }
}
