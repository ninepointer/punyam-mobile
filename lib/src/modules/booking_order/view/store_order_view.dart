import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:punyam/src/app/app.dart';

class StoreOrderView extends StatefulWidget {
  const StoreOrderView({Key? key}) : super(key: key);

  @override
  State<StoreOrderView> createState() => _StoreOrderViewState();
}

class _StoreOrderViewState extends State<StoreOrderView> {
  late BookingController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<BookingController>();
    controller.getAllStoreOrdersDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppConstants.getAppPadding(context),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "My Orders",
                      style: AppStyles.tsBlackMedium18
                          .copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                controller.userAllStoreOrders.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.userAllStoreOrders.length,
                        itemBuilder: (context, index) {
                          var order = controller.userAllStoreOrders[index];
                          return Column(
                            children: [
                              Container(
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     OrderCardTile(
                                    //       label: 'Order Name',
                                    //       value:
                                    //           order.itemDetails?.isNotEmpty ??
                                    //                   false
                                    //               ? order.itemDetails![0].itemId
                                    //                   ?.name
                                    //               : '-',
                                    //     ),
                                    //     OrderCardTile(
                                    //       isRightAlign: true,
                                    //       label: 'Contact No.',
                                    //       value: order.mobile ?? '-',
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height:
                                    //       MediaQuery.of(context).size.width *
                                    //           0.016,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     OrderCardTile(
                                    //       label: 'Order Amount',
                                    //       value:
                                    //           order.itemDetails?.isNotEmpty ??
                                    //                   false
                                    //               ? order.itemDetails![0]
                                    //                   .orderAmount
                                    //                   .toString()
                                    //               : '-',
                                    //     ),
                                    //     OrderCardTile(
                                    //       isRightAlign: true,
                                    //       label: 'Category id',
                                    //       value:
                                    //           order.itemDetails?.isNotEmpty ??
                                    //                   false
                                    //               ? order.itemDetails![0]
                                    //                   .categoryId?.sId
                                    //               : '-',
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height:
                                    //       MediaQuery.of(context).size.width *
                                    //           0.016,
                                    // ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        OrderCardTile(
                                          label: 'Order date',
                                          value: FormatHelper
                                              .formatDateTimeOnlyToIST(
                                                  order.orderDate),
                                        ),
                                        OrderCardTile(
                                            isRightAlign: true,
                                            label: 'Contact No.',
                                            value: order.mobile),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.016,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        OrderCardTile(
                                          label: 'Status',
                                          value: order.status ?? '-',
                                          valueColor: order.status == "Approved"
                                              ? AppColors.success
                                              : AppColors.danger,
                                        ),
                                        OrderCardTile(
                                          isRightAlign: true,
                                          label: 'Payment Status',
                                          value: order.paymentDetails
                                                  ?.paymentStatus ??
                                              '-',
                                          valueColor: order.status == "Paid"
                                              ? AppColors.success
                                              : AppColors.danger,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.016,
                                    ),

                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     OrderCardTile(
                                    //       label: 'Address',
                                    //       value:
                                    //           "${order.addressDetails?.houseOrFlatNo ?? ''}, ${order.addressDetails?.locality ?? ''}, ${order.addressDetails?.landmark ?? ''}, ${order.addressDetails?.city ?? ''}, ${order.addressDetails?.state ?? ''}, ${order.addressDetails?.country}",
                                    //     ),
                                    //   ],
                                    // ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Address",
                                              style: AppStyles.tsGreyMedium12,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child: Text(
                                                "${order.addressDetails?.houseOrFlatNo ?? ''}, ${order.addressDetails?.locality ?? ''}, ${order.addressDetails?.landmark ?? ''}, ${order.addressDetails?.city ?? ''}, ${order.addressDetails?.state ?? ''}, ${order.addressDetails?.country}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .tsMedium12,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                    ),

                                    for (var item in order.itemDetails ?? [])
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: ClipRRect(
                                                      child: Image.network(
                                                        item.itemId.image.url ??
                                                            "",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 150,
                                                        child: Text(
                                                          "${item.itemId.name}"
                                                              .capitalizeFirst
                                                              .toString(),
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${item.itemId.minOrderQuantity} ${item.itemId.unit}",
                                                            style: AppStyles
                                                                .tsGreyRegular14,
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Icon(
                                                            Icons.circle,
                                                            size: 10,
                                                            color:
                                                                AppColors.grey,
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            "Qty: ${item.orderQuantity}",
                                                            style: AppStyles
                                                                .tsGreyRegular14,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "${FormatHelper.formatNumbers((item.orderAmount) * (item.orderQuantity), decimal: 0)}",
                                                style:
                                                    AppStyles.tsBlackMedium16,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : StoreOrderNoBookingDataFound()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCardTile extends StatelessWidget {
  final String? label;
  final String? value;
  final Color? valueColor;
  final bool isCenterAlign;
  final bool isRightAlign;

  const OrderCardTile({
    super.key,
    this.label,
    this.value,
    this.valueColor,
    this.isRightAlign = false,
    this.isCenterAlign = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isRightAlign
          ? CrossAxisAlignment.end
          : (isCenterAlign
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start),
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

class StoreOrderNoBookingDataFound extends StatelessWidget {
  final String? label;
  final String? imagePath;
  const StoreOrderNoBookingDataFound({
    Key? key,
    this.label,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            imagePath == null
                ? Icon(
                    Icons.error_outline_rounded,
                    size: 36,
                    color: AppColors.grey.shade100,
                  )
                : Image.asset(
                    imagePath ?? '',
                    height: 48,
                    width: 48,
                  ),
            SizedBox(height: 8),
            Align(
              child: Text(
                label ?? 'No Bookings Found!',
                style: Theme.of(context).textTheme.tsRegular16,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
