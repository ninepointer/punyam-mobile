import 'package:flutter/material.dart';
import 'package:punyam/src/core/core.dart';
import 'package:punyam/src/app/app.dart';

class CartPageWidget extends StatefulWidget {
  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  int quantity = 0;
  // Sample data for demonstration
  // List<CartItem> cartItems = [
  //   CartItem(
  //       name: 'Product 1',
  //       price: 20.0,
  //       imageUrl: 'https://example.com/product1.jpg'),
  //   CartItem(
  //       name: 'Product 2',
  //       price: 30.0,
  //       imageUrl: 'https://example.com/product2.jpg'),
  //   CartItem(
  //       name: 'Product 3',
  //       price: 25.0,
  //       imageUrl: 'https://example.com/product3.jpg'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: 1, //hardcoded
        itemBuilder: (context, index) {
          return
              // CartItemCard(cartItem: cartItems[index]);
              Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(15.0), // Adjust the circular border
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
                          15.0), // Adjust the circular border
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
    );
  }
}

// class CartItem {
//   final String name;
//   final double price;
//   final String imageUrl;

//   CartItem({required this.name, required this.price, required this.imageUrl});
// }

// class CartItemCard extends StatelessWidget {
//   final CartItem cartItem;

//   CartItemCard({required this.cartItem});

//   //leading: Image.network(cartItem.imageUrl,
//   // title: Text(cartItem.name),

//   @override
//   Widget build(BuildContext context) {
//     return
//         Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0), // Adjust the circular border
//       ),
//       elevation: 5.0, // Add shadow to the card
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(AppImages.carPuja),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius:
//                     BorderRadius.circular(15.0), // Adjust the circular border
//               ),
//             ),
//             SizedBox(width: 10.0),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Product name',
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                   Text(
//                     cartItem.name,
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                 ],
//               ),
//             ),
//             Container(),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   'Price',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 Text(
//                   '\$${cartItem.price.toStringAsFixed(2)}',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

