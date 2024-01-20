import 'package:flutter/material.dart';
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
    controller.bookingPoojaId = controller.selectedPoojaById.value.sId;
    controller.bookingTierId = widget.tierDetails?.sId ?? "";
    controller.bookingAmount = widget.packageDetails?.price.toString();
  }

  bool validateBookingDetails() {
    if (controller.fullNameTextController.text.isEmpty ||
        controller.mobileNumberTextController.text.isEmpty ||
        controller.bookingDateTextController.text.isEmpty ||
        controller.addressTextController.text.isEmpty ||
        controller.pinCodeTextController.text.isEmpty ||
        controller.selectedCity.isEmpty ||
        controller.selectedState.isEmpty) {
      // At least one of the required fields is empty
      return false;
    }

    // Add more validation checks if needed

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
                    left: MediaQuery.of(context).size.width / 2 - 38,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Selected Package - ${widget.tierDetails?.tierName}",
                              style: AppStyles.tsBlackMedium12,
                              softWrap: true,
                            ),
                          ),
                          if (widget.tierDetails?.postPoojaCleanUpIncluded ==
                              true)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Pooja cleanup included",
                                style: AppStyles.tsBlackMedium12,
                                softWrap: true,
                              ),
                            ),
                          if (widget.tierDetails?.poojaItemsIncluded == true)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Pooja items included",
                                style: AppStyles.tsBlackMedium12,
                                softWrap: true,
                              ),
                            ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Total number of main pandit - ${widget.tierDetails?.numberOfMainPandit}",
                              style: AppStyles.tsBlackMedium12,
                              softWrap: true,
                            ),
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
                        // All fields are filled, proceed with booking
                        controller.getUserBookingDetails();
                      } else {
                        // Show a Snackbar notification
                        SnackbarHelper.showSnackbar(
                            'Please fill all the fields before confirming booking');
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
