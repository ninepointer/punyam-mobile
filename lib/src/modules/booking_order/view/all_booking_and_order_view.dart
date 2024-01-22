import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punyam/src/modules/booking_order/booking_index.dart';
import 'package:punyam/src/app/app.dart';

class AllOrdersAndBookingView extends StatefulWidget {
  const AllOrdersAndBookingView({Key? key}) : super(key: key);

  @override
  _AllOrdersAndBookingViewState createState() =>
      _AllOrdersAndBookingViewState();
}

class _AllOrdersAndBookingViewState extends State<AllOrdersAndBookingView> {
  late BookingController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<BookingController>();
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          bottom: TabBar(
            indicatorColor: AppColors.lightGreen,
            tabs: [
              Tab(
                child: Text(
                  'Store orders',
                  style: Theme.of(context).textTheme.tsRegular16,
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
        body: Visibility(
          child: TabBarView(
            children: [
              StoreOrderView(),
              BookingOrderView(),
            ],
          ),
        ),
      ),
    );
  }
}
