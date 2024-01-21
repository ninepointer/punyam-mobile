import 'package:flutter/material.dart';
import 'package:punyam/src/core/core.dart';
import 'package:punyam/src/app/app.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';

class CartPageWidget extends GetView<StoreController> {
  const CartPageWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Obx(() => Stack(
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
              ),
            ],
          )),
    );
  }
}
