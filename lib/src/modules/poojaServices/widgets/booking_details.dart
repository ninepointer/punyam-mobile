import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punyam/src/core/widgets/common_text_field_for_signin.dart';
import '../../../app/app.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  late PoojaServicesController controller;
  late HomeController homeController;
  @override
  void initState() {
    controller = Get.find<PoojaServicesController>();
    homeController = Get.find<HomeController>();
    super.initState();

    controller.addressTextController.clear();
    controller.mobileNumberTextController.clear();
    controller.bookingDateTextController.clear();
    controller.fullNameTextController.clear();
    controller.addressTextController.clear();
    controller.pinCodeTextController.clear();
    controller.bookingAddressTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isProfileLoadingStatus,
        child: ListViewShimmer(
          itemCount: 8,
          shimmerCard: SmallCardShimmer(),
        ),
        replacement: Container(
          color: Theme.of(context).cardColor,
          margin: EdgeInsets.only(top: 4),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () => controller.showDateTimePicker(context),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: CommonTextFieldForSingIn(
                      isDisabled: true,
                      padding: EdgeInsets.zero,
                      controller: controller.bookingDateTextController,
                      hintText: 'Choose your booking date and time',
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.grey,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter booking date and time';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    BottomSheetHelper.openBottomSheet(
                        context: context, child: BookingAddressBottomSheet());
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: CommonTextFieldForSingIn(
                      isDisabled: true,
                      padding: EdgeInsets.zero,
                      controller: controller.bookingAddressTextController,
                      hintText: 'Select an address for booking',
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.grey,
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter booking date and time';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                ),
                // GestureDetector(
                //   child: Text("Select Your Address"),
                //   onTap: () {
                //     BottomSheetHelper.openBottomSheet(
                //         context: context, child: BookingAddressBottomSheet());
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
