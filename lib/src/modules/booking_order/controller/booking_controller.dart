import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../app/app.dart';

class BookingBinding implements Bindings {
  @override
  void dependencies() => Get.put(HomeController());
}

class BookingController extends BaseController<BookingOrderRepository> {
  final userDetails = LoginDetailsResponse().obs;
  LoginDetailsResponse get userDetailsData => userDetails.value;

  Future loadData() async {
    userDetails.value = AppStorage.getUserDetails();
  }
}
