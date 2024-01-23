import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class OrderSuccessPage extends StatelessWidget {
  final String orderId;
  final String orderAmount;
  final String paymentMethod;

  OrderSuccessPage({
    required this.orderId,
    required this.orderAmount,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Successful'),
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
              'Your order has been placed successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            // _buildOrderDetails('Order ID', orderId),
            _buildOrderDetails('Order Amount', '₹$orderAmount'),
            _buildOrderDetails('Payment Method', paymentMethod),
            SizedBox(height: 40.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.cinnamonStickColor),
              ),
              onPressed: () {
                // Implement any action you want, e.g., navigate to home page
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Continue Shopping'),
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
