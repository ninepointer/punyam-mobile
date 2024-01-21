import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/base.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() => Get.put(StoreController());
}

class StoreController extends BaseController<StoreRepository> {
  final isLoading = false.obs;
  bool get isLoadingStatus => isLoading.value;

  // final isMandirLoading = false.obs;
  // bool get isMandirLoadingStatus => isMandirLoading.value;

  // final isSearchMandirLoading = false.obs;
  // bool get isSearchMandirLoadingStatus => isSearchMandirLoading.value;

  final dashboardCarouselList = <DashboardCarousel>[].obs;
  final storeCatagoryList = <StoreCatagoryList>[].obs;
  final storeItemCatagoryWiseList = <StoreCatagoryItemList>[].obs;
  final storeCartItems = <StoreCartList>[].obs;

  RxString cartItemId = "".obs;
  RxInt cartItemQuantity = 0.obs;

  final carouselListforMandir = <DashboardCarousel>[].obs;
  final searchTextController = TextEditingController();
  final isSearchCleared = false.obs;

  // final popularMandirsearchTextController = TextEditingController();
  // final dhamMandirsearchTextController = TextEditingController();
  // final allMandirsearchTextController = TextEditingController();
  // final mandirByDevtasearchTextController = TextEditingController();

  final isFavorite = false.obs;

  @override
  void onClose() {
    print("Hello");
    // allMandirsearchTextController.clear();

    super.onClose();
  }

  // final currentPage = 0.obs;
  // final totalItems = 0.obs;
  // final itemsPerPage = 0.obs;
  // final isLoadingMore = false.obs;

  Future loadData() async {
    await getDashboardCarousel();
    await getAllStoreCatagoryList();
    await getStoreCartItemsDetails();
  }
//all functions down here

  Future getDashboardCarousel() async {
    isLoading(true);
    try {
      final RepoResponse<DashboardCarouselResponse> response =
          await repository.getDashboardCarousel();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          // Create a new list to store items you want to keep
          List<DashboardCarousel> updatedList = [];

          for (DashboardCarousel carousel in response.data?.data ?? []) {
            if (carousel.position == "Home") {
              updatedList.add(carousel);
            }
          }

          // Clear the original list and add items from the updated list
          dashboardCarouselList.clear();
          dashboardCarouselList.addAll(updatedList);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    } finally {
      isLoading(false);
    }
  }

  Future getAllStoreCatagoryList() async {
    isLoading(true);
    try {
      final RepoResponse<StoreCatagoryResponse> response =
          await repository.getAllCategories();
      if (response.data != null) {
        storeCatagoryList(response.data?.data ?? []);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
    isLoading(false);
  }

  Future getAllItemsCatagoryWistDetails(String? id) async {
    try {
      final RepoResponse<StoreCatagoryWiseItemsResponse> response =
          await repository.getAllItemCatagoryWise(id);
      if (response.data != null) {
        storeItemCatagoryWiseList(response.data?.data ?? []);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future getStoreCartItemsDetails() async {
    try {
      final RepoResponse<StoreCartResponse> response =
          await repository.getAllItemCartItems();
      if (response.data != null) {
        storeCartItems(response.data?.data ?? []);
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future storeAddToCartDetails() async {
    AddTocartRequest data = AddTocartRequest(
      itemId: cartItemId.value,
      quantity: cartItemQuantity.value,
    );
    try {
      final RepoResponse<GenericResponse> response =
          await repository.addToCart(data.toJson());

      if (response.data != null) {
        if (response.data?.status == "success") {
          // SnackbarHelper.showSnackbar(response.data?.message);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log('Save: ${e.toString()}');
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }

  Future removeFromCartDetails() async {
    RemoveFromcartRequest data = RemoveFromcartRequest(
      itemId: cartItemId.value,
    );
    try {
      final RepoResponse<GenericResponse> response =
          await repository.removeFromCart(data.toJson());

      if (response.data != null) {
        if (response.data?.status == "success") {
          // SnackbarHelper.showSnackbar(response.data?.message);
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log('Save: ${e.toString()}');
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    }
  }
}
