import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:punyam/src/modules/booking_order/booking_index.dart';
import 'package:punyam/src/app/app.dart';

class AllOrdersAndBookingView extends GetView<BookingController> {
  const AllOrdersAndBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // title: const Text('Order Book'),
          toolbarHeight: 10,
          bottom: TabBar(
            indicatorColor: AppColors.lightGreen,
            tabs: [
              Tab(
                child: Text(
                  'Store orders',
                  style: Theme.of(context).textTheme.tsRegular12,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  'My Bookings',
                  style: Theme.of(context).textTheme.tsRegular16,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: Obx(
          () => Visibility(
            visible: !controller.isLoadingStatus,
            replacement: CommonLoader(),
            child: TabBarView(
              children: [
                StoreOrderView(),
                BookingOrderView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
