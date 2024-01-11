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

  final searchTextController = TextEditingController();

  Future loadData() async {}
}
