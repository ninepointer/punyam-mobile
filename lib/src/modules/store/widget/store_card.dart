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
    quantity = controller.getQuantityByItemId(widget.item?.sId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            // width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Image.network(
              widget.item?.image?.url ?? '',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 0),
        // Display product name
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            height: 15,
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
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            child: Text(
              "${widget.item?.minOrderQuantity} ${widget.item?.unit}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
        ),

        // Display product description

        Container(
          height: 25,
          padding: EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              quantity == 0
                  ? Text(
                      "${FormatHelper.formatNumbers((widget.item?.price ?? 0), decimal: 0)}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                  : Text(
                      "${FormatHelper.formatNumbers((widget.item?.price ?? 0) * quantity, decimal: 0)}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
              quantity != 0 ? 
              Container(
                margin: EdgeInsets.only(right: 6),
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
                            controller.totalCartItemsQuantity.value--;
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
                          controller.totalCartItemsQuantity.value++;
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
              ):
              GestureDetector(
                      onTap: () {
                        setState(() {
                          // Increase quantity by 1
                          storeQuantity = 0;

                          quantity++;
                          storeQuantity = storeQuantity + 1;
                          controller.totalCartItemsQuantity.value++;
                          controller.cartItemQuantity.value = storeQuantity;
                          controller.cartItemId.value =
                              widget.item!.sId.toString();
                          controller.storeAddToCartDetails();
                          // showSnackBar("Increased", quantity);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "+",
                          style: AppStyles.tsBlackMedium20.copyWith(
                            color: AppColors.cinnamonStickColor,
                          ),
                        ),
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
