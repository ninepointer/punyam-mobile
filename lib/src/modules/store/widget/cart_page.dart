import 'package:flutter/material.dart';
import 'package:punyam/src/core/core.dart';
import 'package:punyam/src/app/app.dart';

class CartPageWidget extends StatefulWidget {
  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 1, //hardcoded
            itemBuilder: (context, index) {
              return
                  // CartItemCard(cartItem: cartItems[index]);
                  Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust the circular border
                ),
                elevation: 5.0, // Add shadow to the card
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.carPuja),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the circular border
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product name', //hardcoded
                                style: AppStyles.tsBlackMedium12),
                            Text(
                              "2 packet", //hardcoded
                              style: AppStyles.tsGreyRegular12,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          color: AppColors.cinnamonStickColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.2,
                          ),
                        ),
                        width: 65,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Decrease quantity by 1
                                  if (quantity == 0) {
                                    // If quantity becomes 0, reset to 1
                                    quantity = 0;
                                  } else {
                                    quantity--;
                                    // showSnackBar("Decreased", quantity);
                                  }
                                });
                              },
                              child: Text(
                                "-",
                                style: AppStyles.tsBlackMedium20.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Increase quantity by 1
                                  quantity++;
                                  //  showSnackBar("Increased", quantity);
                                });
                              },
                              child: Text(
                                "+",
                                style: AppStyles.tsBlackMedium20.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Total Price',
                            style: AppStyles.tsBlackMedium12,
                          ),
                          Text(
                            "₹30", //hardcoded
                            // '\$${cartItem.price.toStringAsFixed(2)}',
                            style: AppStyles.tsBlackMedium14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 650,
            left: 0,
            bottom: 0,
            right: 0,
            child: InkWell(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.cinnamonStickColor,
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Get.isDarkMode
                    //         ? Color(0xFF151F2B).withOpacity(0.8)
                    //         : Colors.grey.withOpacity(0.2),
                    //     spreadRadius: 2,
                    //     blurRadius: 4,
                    //     offset: Offset(0, 2),
                    //   ),
                    // ],
                  ),
                  child: Center(
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
