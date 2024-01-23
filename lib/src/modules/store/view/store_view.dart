import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';
import 'package:punyam/src/modules/store/view/store_search_view.dart';
import 'package:punyam/src/modules/store/widget/store_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StoreView extends StatefulWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  late StoreController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<StoreController>();
    controller.loadData();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mandir Store"),
        backgroundColor: Colors.grey[50],
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () async {
              await Get.to(
                () => CartPageWidget(),
              );
              await controller.getStoreCartItemsDetails();
              controller.getAllItemsCatagoryWistDetails(
                  controller.selectedStoreCategory.value.sId);
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await Get.to(
                () => StoreSearchView(),
              );
            },
          ),
        ],
      ),
      body: Obx(
        () => Row(
          //drawer code here
          children: [
            // Drawer implementation with 10 items named with random colors
            Drawer(
              width: MediaQuery.of(context).size.width * 0.20,
              child: ListView.builder(
                itemCount: controller.storeCatagoryList.length,
                itemBuilder: (context, index) {
                  var category = controller.storeCatagoryList[index];
                  return SizedBox(
                    height: MediaQuery.of(context).size.width * 0.25,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Circular cropped image
                          Container(
                            // padding: EdgeInsets.only(top: 10),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.network(
                                  category.image!.url.toString(),
                                  width:
                                      MediaQuery.of(context).size.width * 0.10,
                                  height:
                                      MediaQuery.of(context).size.width * 0.10,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // Title below the image
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              category.name.toString(),
                              maxLines:
                                  2, // Allow text to wrap to the second line
                              overflow: TextOverflow
                                  .ellipsis, // Ellipsis for overflow
                              style: AppStyles.tsBlackRegular8,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      tileColor: Colors.white,
                      selectedTileColor: Colors.orangeAccent.withOpacity(0.5),
                      onTap: () async {
                        setState(() {
                          _selectedIndex = index;
                        });
                        controller.selectedStoreCategory.value = category;
                        await controller
                            .getAllItemsCatagoryWistDetails(category.sId);
                        log(controller.selectedStoreCategory.value.sId
                            .toString());
                      },
                      selected: _selectedIndex == index,
                    ),
                  );
                },
              ),
            ),

            // Main content area goes here
            SingleChildScrollView(
              child: Column(
                children: [
                  // Adjust the height as needed
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: CarouselSlider.builder(
                        itemCount: controller.dashboardCarouselList.length,
                        itemBuilder: (context, int index, _) {
                          return GestureDetector(
                            // onTap: () => controller.dashboardCarouselList(
                            //   controller.dashboardCarouselList[index]
                            //           .linkToCarousel ??
                            //       '',
                            // ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  color: AppColors.grey.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    "${controller.dashboardCarouselList[index].carouselImage ?? ''}",
                                    fit: BoxFit.fill,
                                    height:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 6),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.78,
                        height: MediaQuery.of(context).size.width * 1.5,
                        child: controller.storeItemCatagoryWiseList.isNotEmpty
                            ? GridView.builder(
                                itemCount:
                                    controller.storeItemCatagoryWiseList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                  mainAxisSpacing: 0,
                                ),
                                itemBuilder: (context, index) {
                                  var item = controller
                                      .storeItemCatagoryWiseList[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      child: StoreCard(item: item),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(
                                          color: Colors.black12,
                                          width: 0.2,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  "No Items Found",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                  ),

                  //),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
