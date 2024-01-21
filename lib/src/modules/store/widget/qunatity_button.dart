import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (quantity == 0) {
            // If quantity is 0, increase to 1
            quantity = 1;
          } else {
            // If quantity is not 0, decrease by 1
            quantity--;
            if (quantity == 0) {
              // If quantity becomes 0, reset to 0
              quantity = 0;
            }
          }
        });
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: quantity == 0
          ? Icon(
              Icons.add,
              color: AppColors.cinnamonStickColor,
              size: 24,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 35, // Adjust the width as needed
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: AppColors.cinnamonStickColor,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        // Decrease quantity by 1
                        quantity--;
                        if (quantity == 0) {
                          // If quantity becomes 0, reset to 0
                          quantity = 0;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 5, // Adjust the width as needed
                  child: Text(
                    quantity.toString(),
                    style: TextStyle(
                      color: AppColors.cinnamonStickColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: AppColors.cinnamonStickColor,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        // Increase quantity by 1
                        quantity++;
                      });
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
