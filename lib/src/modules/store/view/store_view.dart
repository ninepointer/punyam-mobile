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
        () => RefreshIndicator(
          onRefresh: () async {
            controller.loadData();
          },
          child: Visibility(
            visible: !controller.isLoadingStatus,
            child: Row(
              //drawer code here
              children: [
                // Drawer implementation with 10 items named with random colors
                Drawer(
                  width: 80,
                  child: ListView.builder(
                    itemCount: controller.storeCatagoryList.length,
                    itemBuilder: (context, index) {
                      var category = controller.storeCatagoryList[index];
                      return SizedBox(
                        height: 80,
                        child: ListTile(
                          title: Column(
                            children: [
                              // Circular cropped image
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: Image.network(
                                    category.image!.url.toString(),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
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
                                  style: AppStyles.tsBlackRegular12,
                                ),
                              ),
                            ],
                          ),
                          tileColor: Colors.white,
                          selectedTileColor:
                              Colors.orangeAccent.withOpacity(0.5),
                          onTap: () async {
                            await controller
                                .getAllItemsCatagoryWistDetails(category.sId);
                            setState(() {
                              _selectedIndex = index;

                              // Navigator.pop(context); // Close the drawer
                            });
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
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.4,
                          width: 280,
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
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
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
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        width: 400,
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
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 310,
                          height: 525,
                          child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            shrinkWrap: true,
                            clipBehavior: Clip.none,
                            // padding: const EdgeInsets.all(
                            //     8.0), // Add padding between items
                            children: [
                              for (int i = 1;
                                  i <
                                      controller
                                          .storeItemCatagoryWiseList.length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.all(
                                      4.0), // Add padding around each item
                                  child: Container(
                                    child: StoreCard(
                                      item: controller
                                          .storeItemCatagoryWiseList[i],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.2,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),

                      //),
                    ],
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
