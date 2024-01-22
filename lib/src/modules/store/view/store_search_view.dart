import 'package:flutter/material.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';
import 'package:punyam/src/modules/store/widget/store_card.dart';
import 'package:punyam/src/modules/store/widget/store_common_tile.dart';
import '../../../app/app.dart';

class StoreSearchView extends GetView<StoreController> {
  const StoreSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 35, left: 25, right: 25),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                decoration: BoxDecoration(
                  color:
                      Get.isDarkMode ? Color(0xFF1B2937) : Colors.orange[100],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.searchTextController,
                        onChanged: (value) {
                          if (value.isEmpty || value == "") {
                            controller.isSearchCleared.value = true;
                          } else {
                            controller.isSearchCleared(false);
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Search Products...",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.isSearchCleared(false);
                                  controller.searchTextController.clear();
                                  Future.delayed(Duration.zero, () {
                                    // Do something after clearing the text
                                  });
                                },
                                icon: Icon(Icons.cancel),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Recent Searches',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    height: 100,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            // Handle recent search item tap
                          },
                        );
                      },
                    ),
                  ),
                  StoreCommonTile(
                    label: "Right From The Mandir",
                    showSeeAllButton: true,
                    isValue: true,
                    seeAllLabel: 'View All >',
                    onPressed: () {
                      // onPressed function here
                    },
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Container(
                      height: 150,
                      child: Row(),
                    ),
                  ),
                  StoreCommonTile(
                    label: "Suggested For You",
                    showSeeAllButton: true,
                    isValue: true,
                    seeAllLabel: 'View All >',
                    onPressed: () {
                      // onPressed function here
                    },
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Container(
                      height: 150,
                      child: Row(),
                    ),
                  ),
                  StoreCommonTile(
                    label: "Popular Categories",
                    showSeeAllButton: true,
                    isValue: true,
                    seeAllLabel: 'View All >',
                    onPressed: () {
                      // onPressed function here
                    },
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Container(
                      height: 150,
                      child: Row(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
