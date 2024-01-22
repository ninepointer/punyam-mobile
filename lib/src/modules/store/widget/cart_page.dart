import 'package:flutter/material.dart';
import 'package:punyam/src/core/core.dart';
import 'package:punyam/src/app/app.dart';
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
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Obx(
        () => Stack(
          children: [
            ListView.builder(
              shrinkWrap: false,
              itemCount: controller.storeCartItems.length, //hardcoded
              itemBuilder: (context, index) {
                var category = controller.storeCartItems[index];
                return StoreCartCard(category: category);
              },
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  BottomSheetHelper.openBottomSheet(
                      context: context, child: PlaceOrderAddressBottomSheet());
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
