import 'package:flutter/material.dart';

class BookingOrderView extends StatefulWidget {
  const BookingOrderView({super.key});

  @override
  State<BookingOrderView> createState() => _BookingOrderViewState();
}

class _BookingOrderViewState extends State<BookingOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Booking Orders"),
      // ),
      body: Center(
        child: Text("Booking Order Page"),
      ),
    );
  }
}
