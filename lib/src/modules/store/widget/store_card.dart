import 'package:flutter/material.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';
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
  int storeQuantity = 0;
  late StoreController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<StoreController>();
    controller.getStoreCartItemsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            // width: MediaQuery.of(context).size.width,
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 0.2,
              ),
            ),
            child: ClipRRect(
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(10),
              //   topRight: Radius.circular(10),
              // ),
              child: Image.network(
                widget.item?.image?.url ?? '',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        // Display product name
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 30,
            child: Text(
              widget.item?.name ?? '',
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            child: Text(
              "Min quantity: ${widget.item?.minOrderQuantity} ${widget.item?.unit}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),

        // Display product description

        Container(
          height: 25,
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
                            storeQuantity--;
                            controller.cartItemQuantity.value = storeQuantity;
                            controller.cartItemId.value =
                                widget.item!.sId.toString();
                            controller.removeFromCartDetails();
                            // showSnackBar("Decreased", quantity);
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
                          storeQuantity = 0;

                          quantity++;
                          storeQuantity = storeQuantity + 1;

                          controller.cartItemQuantity.value = storeQuantity;
                          controller.cartItemId.value =
                              widget.item!.sId.toString();
                          controller.storeAddToCartDetails();
                          // showSnackBar("Increased", quantity);
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
    );
  }

//   void showSnackBar(String action, int quantity) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           "${widget.item?.name} added to cart\nPrice: ${FormatHelper.formatNumbers((widget.item?.price ?? 0) * quantity, decimal: 0)}\nQuantity: $quantity",
//         ),
//         duration: Duration(seconds: 4),
//         action: SnackBarAction(
//           label: 'View Cart',
//           onPressed: () {
//             Get.to(() => CartPageWidget());
//           },
//         ),
//       ),
//     );
//   }
// }
}
