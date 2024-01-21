import 'package:flutter/material.dart';
import 'package:punyam/src/modules/store/widget/qunatity_button.dart';
import 'package:punyam/src/app/app.dart';
import '../../../core/core.dart';

class StoreCard extends StatefulWidget {
  final StoreCatagoryItemList? item;

  StoreCard({this.item, Key? key}) : super(key: key);

  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 0.2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                widget.item?.image?.url ?? '',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 4),
          // Display product name
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: 40,
              child: Text(
                widget.item?.name ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Display product description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              widget.item?.description ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),

          Container(
            height: 35,
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${FormatHelper.formatNumbers((widget.item?.price ?? 0) * quantity, decimal: 0)}",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
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
                              showSnackBar("Decreased", quantity);
                            }
                          });
                        },
                        child: Text(
                          "-",
                          style: AppStyles.tsBlackMedium20.copyWith(
                            color: AppColors.cinnamonStickColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(
                          color: AppColors.cinnamonStickColor,
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
                            showSnackBar("Increased", quantity);
                          });
                        },
                        child: Text(
                          "+",
                          style: AppStyles.tsBlackMedium20.copyWith(
                            color: AppColors.cinnamonStickColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String action, int quantity) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${widget.item?.name} added to cart\nPrice: ${FormatHelper.formatNumbers((widget.item?.price ?? 0) * quantity, decimal: 0)}\nQuantity: $quantity",
        ),
        duration: Duration(seconds: 4),
        action: SnackBarAction(
          label: 'View Cart',
          onPressed: () {
            Get.to(() => CartPageWidget());
          },
        ),
      ),
    );
  }
}
