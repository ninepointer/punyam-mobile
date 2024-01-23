import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class BookingSuccessPage extends StatelessWidget {
  final String bookingdate;
  final String bookingAddress;
  final String paymentMethod;

  BookingSuccessPage({
    required this.bookingdate,
    required this.bookingAddress,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Successful'),
        // backgroundColor: Colors.green, // Customize the app bar color
      ),
      body: Padding(
        padding: AppConstants.getAppPadding(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Thank You!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Your Booking has been placed successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            // _buildOrderDetails('Order ID', orderId),
            _buildOrderDetails('Booking Date', bookingdate),
            _buildOrderDetails('Payment Method', paymentMethod),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Booking Address", style: TextStyle(fontSize: 16.0)),
                  SizedBox(
                    width: 60,
                  ),
                  Flexible(
                    child: Text(
                      bookingAddress,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 40.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.cinnamonStickColor),
              ),
              onPressed: () {
                // Implement any action you want, e.g., navigate to home page
                Navigator.pop(context);
              },
              child: Text('Go to Booking Page'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetails(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16.0)),
          Text(value,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
