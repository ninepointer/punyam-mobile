import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:punyam/src/app/app.dart';

class BookingOrderView extends StatefulWidget {
  const BookingOrderView({Key? key}) : super(key: key);

  @override
  State<BookingOrderView> createState() => _BookingOrderViewState();
}

class _BookingOrderViewState extends State<BookingOrderView> {
  late BookingController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<BookingController>();
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    print("Hello ${controller.userAllBookingOrders.toJson()}");
    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            controller.loadData();
            return Future.value();
          },
          child: Visibility(
            visible: !controller.isLoadingStatus,
            child: SingleChildScrollView(
              child: Padding(
                padding: AppConstants.getAppPadding(context),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "My Bookings",
                          style: AppStyles.tsBlackMedium18
                              .copyWith(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.userAllBookingOrders.length,
                      itemBuilder: (context, index) {
                        var order = controller.userAllBookingOrders[index];
                        return Container(
                          padding: EdgeInsets.all(8),
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
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BookingCardTile(
                                    label: 'Name',
                                    value: order.fullName
                                        .toString()
                                        .capitalizeFirst,
                                  ),
                                  BookingCardTile(
                                    isRightAlign: true,
                                    label: 'Contact No.',
                                    value: order.mobile,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.016,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BookingCardTile(
                                    label: 'Pooja name',
                                    value: order.specificProductId?.name
                                        .toString()
                                        .capitalizeFirst,
                                  ),
                                  BookingCardTile(
                                    isRightAlign: true,
                                    label: 'Pooja id',
                                    value: order.productId,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.016,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BookingCardTile(
                                    label: 'Booking date',
                                    value: FormatHelper.formatDateTime(
                                        order.bookingDate),
                                  ),
                                  BookingCardTile(
                                    isRightAlign: true,
                                    label: 'Booking amount',
                                    value: FormatHelper.formatNumbers(
                                        order.bookingAmount,
                                        decimal: 0),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.016,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BookingCardTile(
                                    label: 'Selected package',
                                    value: order.tier?.tierName
                                        .toString()
                                        .capitalizeFirst,
                                  ),
                                  BookingCardTile(
                                    isRightAlign: true,
                                    label: 'Status',
                                    value: order.status,
                                    valueColor: order.status == "Approved"
                                        ? AppColors.success
                                        : AppColors.danger,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.016,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BookingCardTile(
                                    label: 'Address',
                                    value:
                                        "${order.addressDetails?.houseOrFlatNo ?? ''}, ${order.addressDetails?.locality ?? ''}, ${order.addressDetails?.landmark ?? ''}, ${order.addressDetails?.city ?? ''}, ${order.addressDetails?.state ?? ''}, ${order.addressDetails?.country}",
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BookingCardTile extends StatelessWidget {
  final String? label;
  final String? value;
  final Color? valueColor;
  final bool isRightAlign;

  const BookingCardTile({
    super.key,
    this.label,
    this.value,
    this.valueColor,
    this.isRightAlign = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isRightAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '-',
          style: AppStyles.tsGreyMedium12,
        ),
        SizedBox(height: 2),
        Text(
          value ?? '-',
          style: Theme.of(context).textTheme.tsMedium12.copyWith(
                color: valueColor,
              ),
        ),
      ],
    );
  }
}
