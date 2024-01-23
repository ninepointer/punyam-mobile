import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:punyam/src/app/app.dart';
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

  final selectedStoreCategory = StoreCatagoryList().obs;
  final bookingAddressTextController = TextEditingController();

  RxString cartItemId = "".obs;
  RxInt cartItemQuantity = 0.obs;

  RxString categoryId = "".obs;
  RxInt orderAmount = 0.obs;
  RxString itemId = "".obs;
  RxInt orderQuantity = 0.obs;

  RxInt totalCartItemsQuantity = 0.obs;

  RxString orderSuccessTotalAmount = "".obs;

  RxString orderSuccessOrderId = "".obs;

  var userBookingData = GetSaveAddressDetails().obs;

  final carouselListforMandir = <DashboardCarousel>[].obs;
  final searchTextController = TextEditingController();
  final isSearchCleared = false.obs;

  RxString city = "".obs;
  RxString state = "".obs;
  RxString landmark = "".obs;
  RxString locality = "".obs;
  RxString floor = "".obs;
  RxString houseNo = "".obs;
  RxString mobile = "".obs;
  RxString pincode = "".obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

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
    // storeCartItems.clear();

    await getDashboardCarousel();
    await getAllStoreCatagoryList();
    getAllItemsCatagoryWistDetails(storeCatagoryList.first.sId);
    selectedStoreCategory.value = storeCatagoryList.first;
  }
//all functions down here

  int getQuantityByItemId(String id) {
    int quantity = 0;
    log("getQuantityByItemId id ${id}");

    for (var item in storeCartItems) {
      log("getQuantityByItemId itemid ${item.sId}");
      log("getQuantityByItemId ${item.sId == id}");
      if (item.itemId?.sId == id) {
        quantity = item.quantity ?? 0;
        log("getQuantityByItemId ${quantity}");
      }
    }
    return quantity;
  }

  void calculateCartQuantity() async {
    await getStoreCartItemsDetails();
    int total = 0;
    for (var item in storeCartItems) {
      total += item.quantity ?? 0;
    }
    totalCartItemsQuantity.value = total;
  }

  Future getDashboardCarousel() async {
    isLoading(true);
    try {
      final RepoResponse<DashboardCarouselResponse> response =
          await repository.getStoreCarousel();
      if (response.data != null) {
        if (response.data?.status?.toLowerCase() == "success") {
          // Create a new list to store items you want to keep
          List<DashboardCarousel> updatedList = [];

          for (DashboardCarousel carousel in response.data?.data ?? []) {
            if (carousel.position == "Store") {
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
    storeCatagoryList.clear();
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
    storeItemCatagoryWiseList.clear();
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
    storeCartItems.clear();
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

  Future updateCart() async {
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

  Future postOrderPlaceDetails() async {
    isLoading(true);

    List<PlaceOrderDetails> ordersList =
        []; // Create a list to store multiple orders

    // Assuming you have a list of order details, update this part accordingly
    for (int i = 0; i < storeCartItems.length; i++) {
      // Assuming storeCartItems[i].itemId.price is of type `num?`
      orderAmount.value = storeCartItems[i].itemId?.price?.toInt() ?? 0;

      // Assuming storeCartItems[i].quantity is of type `int?`
      orderQuantity.value = storeCartItems[i].quantity ?? 0;

      // Assuming storeCartItems[i].itemId.sId is of type `String?`
      cartItemId.value = storeCartItems[i].itemId?.sId ?? "";

      // Assuming storeCartItems[i].itemId.sId is of type `String?`
      itemId.value = storeCartItems[i].itemId?.sId ?? "";

      PlaceOrderDetails order = PlaceOrderDetails(
        orderAmount: orderAmount.value,
        orderQuantity: orderQuantity.value,
        categoryId: cartItemId.value,
        itemId: itemId.value,
      );
      ordersList.add(order);
    }

    PlaceOrderRequest data = PlaceOrderRequest(
      address: "",
      pincode: pincode.value,
      city: city.value,
      state: state.value,
      country: "India",
      latitude: latitude.value,
      longitude: longitude.value,
      landmark: landmark.value,
      locality: locality.value,
      floor: floor.value,
      houseOrFlatNo: houseNo.value,
      mobile: mobile.value,
      orderDetails: ordersList, // Set the list of orders
    );

    try {
      final RepoResponse<GenericResponse> response =
          await repository.placeCartOrder(data.toJson());

      if (response.data != null) {
        // await Get.find<AuthController>().getUserDetails(navigate: false);
        // loadData();
        if (response.data?.status == "success") {
          // SnackbarHelper.showSnackbar(response.data?.message);
          Get.to(() => OrderSuccessPage(
              orderId: orderSuccessOrderId.value,
              orderAmount: orderSuccessTotalAmount.value,
              // controller: StoreController(),
              paymentMethod: "Cash on Delivery"));
        }
      } else {
        SnackbarHelper.showSnackbar(response.error?.message);
      }
    } catch (e) {
      log('Save: ${e.toString()}');
      SnackbarHelper.showSnackbar(ErrorMessages.somethingWentWrong);
    } finally {
      isLoading(false);
    }
  }
}
