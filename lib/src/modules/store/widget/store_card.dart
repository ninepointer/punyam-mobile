import 'package:flutter/material.dart';
import 'package:punyam/src/modules/store/widget/qunatity_button.dart';

import '../../../core/core.dart';

class StoreCard extends StatefulWidget {
  const StoreCard({super.key});

  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Set your desired style here
      // elevation: 4, // Example elevation
      // color: Colors.blue, // Example background color
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10), // Example border radius
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image in the top half
          Container(
            margin: EdgeInsets.only(left: 5),
            height: 120,
            child: Image.asset(
              AppImages.mandir,
              // width: 100,
              // height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          // "175g" text below the image
          Text(
            '175g',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
          Spacer(), // To push the next elements to the bottom
          // "Rupees 50" text in the bottom left
          Row(
            children: [
              Text(
                '₹50',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Spacer(), // To push the next element to the right
              // "+" button in the bottom right

              QuantityButton()
              // ElevatedButton(
              //   onPressed: () {
              //     // Handle button press
              //   },
              //   style: ButtonStyle(
              //     elevation: MaterialStateProperty.all<double>(0),
              //     backgroundColor:
              //         MaterialStateProperty.all<Color>(Colors.white),
              //   ),
              //   child: Icon(
              //     Icons.add,
              //     color: AppColors.cinnamonStickColor,
              //     size: 24, // Adjust the size of the icon as needed
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
