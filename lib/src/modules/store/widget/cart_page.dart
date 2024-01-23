import 'package:flutter/material.dart';
import 'package:punyam/src/core/core.dart';
import 'package:punyam/src/app/app.dart';
import 'package:punyam/src/core/widgets/common_text_field_for_signin.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({Key? key}) : super(key: key);

  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  late StoreController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<StoreController>();
    // controller.getStoreCartItemsDetails();
    controller.calculateCartQuantity();
    controller.bookingAddressTextController.clear();
  }

  num deliveryCharge = 0;
  num gstCharge = 0;

  num totalPrice() {
    // controller.updateCart();
    num totalPrice = 0;

    for (var cartItem in controller.storeCartItems) {
      totalPrice += ((cartItem.itemId?.price ?? 0) * (cartItem.quantity ?? 0));
    }
    print("totalprice $totalPrice");
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Obx(
        () => Padding(
          padding: AppConstants.getAppPadding(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                controller.storeCartItems.length != 0
                    ? Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount:
                              controller.storeCartItems.length, //hardcoded
                          itemBuilder: (context, index) {
                            var category = controller.storeCartItems[index];
                            return StoreCartCard(category: category);
                          },
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 100,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Your cart is empty!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.cinnamonStickColor),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Continue Shopping'),
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 12,
                ),
                if (controller.storeCartItems.length != 0)
                  Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the circular border
                    ),
                    elevation: 5.0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Item Total",
                                style: AppStyles.tsBlackRegular14,
                              ),
                              Text(FormatHelper.formatNumbers(totalPrice(),
                                  decimal: 0))
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.012,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery Fee",
                                style: AppStyles.tsGreyRegular14,
                              ),
                              Text(FormatHelper.formatNumbers(deliveryCharge,
                                  decimal: 0))
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.012,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "GST",
                                style: AppStyles.tsGreyRegular14,
                              ),
                              Text(FormatHelper.formatNumbers(gstCharge,
                                  decimal: 0))
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.032,
                          ),
                          Divider(
                            height: 1,
                            color: AppColors.grey,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.032,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "To Pay",
                                style: AppStyles.tsBlackRegular16,
                              ),
                              Text(
                                "${FormatHelper.formatNumbers((totalPrice() + deliveryCharge + gstCharge), decimal: 0)}",
                                style: AppStyles.tsBlackMedium16,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                if (controller.storeCartItems.length != 0)
                  Column(
                    children: [
                      CommonCard(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        margin: EdgeInsets.only(top: 10),
                        children: [
                          Row(
                            children: [
                              Radio(
                                value:
                                    'COD', // Set the value for "Cash on Delivery"
                                groupValue:
                                    'COD', // Set the groupValue to the same value
                                onChanged:
                                    null, // Disable the onChanged callback
                                visualDensity: VisualDensity.compact,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Cash on Delivery',
                                style: Theme.of(context).textTheme.tsRegular14,
                              ),
                              Spacer(),
                              Text(
                                FormatHelper.formatNumbers(
                                  totalPrice(),
                                  decimal: 0,
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .tsMedium16
                                    .copyWith(
                                      color: AppColors.success,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CommonCard(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        margin: EdgeInsets.only(top: 8),
                        children: [
                          Row(
                            children: [
                              Radio(
                                value:
                                    null, // Set the value to null to disable the option
                                groupValue:
                                    'COD', // Set the groupValue to the same value
                                onChanged:
                                    null, // Disable the onChanged callback
                                visualDensity: VisualDensity.compact,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Online Payment',
                                style: Theme.of(context)
                                    .textTheme
                                    .tsRegular14
                                    .copyWith(
                                      color: Colors
                                          .grey, // Set a different color for disabled option
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(
                  height: 12,
                ),
                if (controller.storeCartItems.length != 0)
                  GestureDetector(
                    onTap: () {
                      BottomSheetHelper.openBottomSheet(
                          context: context,
                          child: PlaceOrderAddressBottomSheet());
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: CommonTextFieldForSingIn(
                        isDisabled: true,
                        padding: EdgeInsets.zero,
                        controller: controller.bookingAddressTextController,
                        hintText: 'Select an address for booking',
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColors.grey,
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter booking date and time';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                  ),
                SizedBox(
                  height: 12,
                ),
                if (controller.storeCartItems.length != 0)
                  InkWell(
                    onTap: () async {
                      if (controller
                          .bookingAddressTextController.text.isEmpty) {
                        // Show snackbar if the address is not selected
                        SnackbarHelper.showSnackbar('Please select an address');
                      } else {
                        // Set order details and place order
                        controller.orderSuccessOrderId.value = "12345567";
                        controller.orderSuccessTotalAmount.value =
                            totalPrice().toString();
                        await controller.postOrderPlaceDetails();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.cinnamonStickColor,
                          borderRadius: BorderRadius.circular(10),
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
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
