import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:punyam/src/core/core.dart';
import 'package:punyam/src/app/app.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';

class StoreCartCard extends StatefulWidget {
  final StoreCartList? category;
  StoreCartCard({this.category, Key? key}) : super(key: key);

  @override
  State<StoreCartCard> createState() => _StoreCartCardState();
}

class _StoreCartCardState extends State<StoreCartCard> {
  late StoreController controller;
  int? quantity;

  @override
  void initState() {
    super.initState();
    controller = Get.find<StoreController>();
    //controller.loadData();
    quantity = widget.category?.quantity;
    controller.orderAmount.value =
        (widget.category?.itemId?.price ?? 0).toInt();
    controller.orderQuantity.value = widget.category?.quantity ?? 0;
    controller.categoryId.value = widget.category?.sId ?? '';
    controller.itemId.value = widget.category?.itemId?.sId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return // CartItemCard(cartItem: cartItems[index]);
        Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Adjust the circular border
      ),
      elevation: 5.0, // Add shadow to the card
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.127,
              width: MediaQuery.of(context).size.width * 0.127,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(15.0), // Adjust the circular border
              ),
              child: ClipOval(
                child: Image.network(
                  widget.category?.itemId?.image?.url?.toString() ??
                      AppImages.logo1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.0255),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.category?.itemId?.name ?? ''}', //hardcoded
                    style: AppStyles.tsBlackMedium12, maxLines: 3,
                  ),
                  Text(
                    "${(quantity ?? 0) * (widget.category?.itemId?.minOrderQuantity ?? 0)} ${widget.category?.itemId?.unit ?? ''}", //hardcoded
                    style: AppStyles.tsGreyRegular12,
                  ),
                ],
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.0255),
            Container(
              margin: EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      log("GestureDetector start $quantity ");
                      setState(() async{
                        // Decrease quantity by 1

                        quantity = quantity! - 1;

                        controller.cartItemQuantity.value = -1;
                        controller.totalCartItemsQuantity.value--;

                        controller.cartItemId.value =
                            widget.category!.itemId!.sId!.toString();
                        await controller.removeFromCartDetails();
                        await controller.updateCart();

                        log("GestureDetector end $quantity ");
                        if (quantity == 0) {
                          quantity = 0;
                          // If quantity becomes 0, reset to 1
                          controller.getStoreCartItemsDetails();
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
                    width: MediaQuery.of(context).size.width * 0.0255,
                  ),
                  Text(
                    "$quantity",
                    style: TextStyle(
                      color: AppColors.cinnamonStickColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.0255,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() async{
                        // Increase quantity by 1
                        // storeQuantity = 0;

                        quantity = quantity! + 1;

                        // storeQuantity = storeQuantity ?? 1 + 1;
                        controller.totalCartItemsQuantity.value++;
                        controller.cartItemQuantity.value = 1;

                        controller.cartItemId.value =
                            widget.category!.itemId!.sId!.toString();
                        await controller.storeAddToCartDetails();
                        await controller.updateCart();
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.127,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Total Price',
                  style: AppStyles.tsBlackMedium12,
                ),
                Text(
                  // "${FormatHelper.formatNumbers((category.quantity!) * (category.itemId!.price!))}",
                  " ${FormatHelper.formatNumbers((widget.category?.itemId?.price ?? 0) * (quantity ?? 0), decimal: 0)}",
                  // '\$${cartItem.price.toStringAsFixed(2)}',
                  style: AppStyles.tsBlackMedium14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
