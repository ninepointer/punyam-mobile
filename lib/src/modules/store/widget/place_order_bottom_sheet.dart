import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punyam/src/app/app.dart';
import 'package:punyam/src/modules/home/views/maps_view.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';

class PlaceOrderAddressBottomSheet extends StatefulWidget {
  const PlaceOrderAddressBottomSheet({super.key});

  @override
  State<PlaceOrderAddressBottomSheet> createState() =>
      _PlaceOrderAddressBottomSheetState();
}

class _PlaceOrderAddressBottomSheetState
    extends State<PlaceOrderAddressBottomSheet> {
  late HomeController homeController;
  late StoreController controller;
  @override
  void initState() {
    homeController = Get.find<HomeController>();
    controller = Get.find<StoreController>();
    homeController.getUserSaveAddressDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Please Select Your Address',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => MapsScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.redAccent,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.0150,
                        ),
                        Text(
                          "Add Address",
                          style: AppStyles.tsBlackRegular16.copyWith(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    "SAVED ADDRESSES",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              if (homeController.userSaveAddress.value.addressDetails != null)
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: homeController
                      .userSaveAddress.value.addressDetails?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = homeController
                        .userSaveAddress.value.addressDetails![index];
                    // controller.userBookingAddressData =
                    //     item as RxList<GetUserSaveAddressData>;
                    // controller.userBookingData = homeController.userSaveAddress;
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            //   String concatenatedText =
                            //       '${item.houseOrFlatNo} ${item.floor} ${item.locality} ${item.landmark} ${item.city} ${item.state}';

                            //   controller.bookingAddressTextController.value =
                            //       controller.bookingAddressTextController.value
                            //           .copyWith(
                            //     text: concatenatedText,
                            //   );
                            //   controller.userBookingData.value = item;
                            controller.pincode.value = item.pincode ?? '';
                            controller.city.value = item.city ?? '';
                            controller.state.value = item.state ?? '';
                            controller.latitude.value =
                                item.location?.coordinates?.first ?? 0.0;
                            controller.longitude.value =
                                item.location?.coordinates?.last ?? 0.0;
                            controller.landmark.value = item.landmark ?? '';
                            controller.locality.value = item.locality ?? '';
                            controller.floor.value = item.floor ?? '';
                            controller.houseNo.value = item.houseOrFlatNo ?? '';
                            controller.mobile.value = item.contactNumber ?? '';

                            await controller.postOrderPlaceDetails();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: orderchooseYourAddressCard(
                              context: context,
                              product: item,
                              controller: homeController),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    );
                    // Other widgets based on your data
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}

Widget orderchooseYourAddressCard({
  required BuildContext context,
  required GetSaveAddressDetails product,
  required HomeController controller,
}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.home_outlined,
            size: 30,
            color: Colors.grey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.tag == ""
                  ? "Home"
                  : "${product.tag}".capitalize.toString(),
              style: AppStyles.tsBlackMedium14,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.0125,
            ),
            Text(
              "${product.houseOrFlatNo ?? ""} ${product.locality ?? ''} ${product.city ?? ''} ${product.state ?? ""}",
              style: AppStyles.tsGreyRegular14,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.0125,
            ),
          ],
        )
      ],
    ),
  );
}
