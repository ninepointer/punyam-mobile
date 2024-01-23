import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:punyam/src/app/app.dart';

class SelectedTierDetailsView extends StatefulWidget {
  final Tiers? tierDetails;
  final Packagess? packageDetails;
  const SelectedTierDetailsView(
      {Key? key, this.tierDetails, this.packageDetails})
      : super(key: key);

  @override
  State<SelectedTierDetailsView> createState() =>
      _SelectedTierDetailsViewState();
}

class _SelectedTierDetailsViewState extends State<SelectedTierDetailsView> {
  late PoojaServicesController controller;
  late HomeController homeController;

  @override
  void initState() {
    super.initState();

    controller = Get.find<PoojaServicesController>();
    homeController = Get.find<HomeController>();
    controller.bookingPoojaId = controller.selectedPoojaById.value.sId;
    controller.bookingTierId = widget.tierDetails?.sId ?? "";
    controller.bookingAmount = widget.packageDetails?.price.toString();
  }

  bool validateBookingDetails() {
    if (controller.bookingDateTextController.text.isEmpty ||
        controller.bookingAddressTextController.text.isEmpty) {
      // At least one of the required fields is empty
      SnackbarHelper.showSnackbar(
          'Please fill all the fields before confirming booking');
      return false;
    }
// Check if the booking time is at least 24 hours from now
    DateTime selectedDateTime = DateFormat("dd-MM-yyyy hh:mm a")
        .parse(controller.bookingDateTextController.text);
    DateTime minimumDateTime = DateTime.now().add(Duration(hours: 24));

    if (selectedDateTime.isBefore(minimumDateTime)) {
      // Booking time is less than 24 hours from now
      SnackbarHelper.showSnackbar(
          'Booking time should be at least 24 hours from now');
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Details")),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.getAppPadding(context),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.brandYellow, width: 1.0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    left: MediaQuery.of(context).size.width / 2 - 48,
                    // Center horizontally
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Image.network(
                        controller.selectedPoojaById.value.image?.url ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${controller.selectedPoojaById.value.name}",
                              style: AppStyles.tsBlackMedium20,
                              softWrap: true,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_right,
                                size: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Selected Package - ${widget.tierDetails?.tierName}",
                                  style: AppStyles.tsBlackRegular14,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.015,
                          ),
                          if (widget.tierDetails?.postPoojaCleanUpIncluded ==
                              true)
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_circle_right,
                                  size: 20,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Pooja cleanup included",
                                    style: AppStyles.tsBlackRegular14,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.015,
                          ),
                          if (widget.tierDetails?.poojaItemsIncluded == true)
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_circle_right,
                                  size: 20,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Pooja items included",
                                    style: AppStyles.tsBlackRegular14,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_right,
                                size: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Total number of main pandit - ${widget.tierDetails?.numberOfMainPandit}",
                                  style: AppStyles.tsBlackRegular14,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              CommonTile(
                label: "Fill Your Booking Details",
              ),
              SizedBox(
                height: 12,
              ),
              BookingDetails(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.cinnamonStickColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: Text("Confirm Booking"),
                    onPressed: () {
                      if (validateBookingDetails()) {
                        controller.getUserBookingDetails();
                        Get.to(() => BookingSuccessPage(
                              bookingdate:
                                  controller.bookingDateTextController.text,
                              bookingAddress:
                                  controller.bookingAddressTextController.text,
                              paymentMethod: "Cash On Delivery",
                            ));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
