import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';
import 'package:punyam/src/modules/store/controller/store_controller.dart';
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
                  width: 75, // Set the width of the drawer
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 80, // Set the height of the ListTile
                        //  Text(TextStyle()),
                        child: ListTile(
                          title: Column(
                            children: [
                              // Circular cropped image
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: Image.asset(
                                    AppImages.mandir,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  // Image.network(
                                  //   'https://example.com/your_image.jpg'
                                  //   ,
                                  //   width: 80,
                                  //   height: 80,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              // Title below the image
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Item $index',
                                  style: AppStyles.tsBlackRegular12,
                                ),
                              ),
                            ],
                          ),
                          tileColor: Colors.white,
                          selectedTileColor:
                              Colors.orangeAccent.withOpacity(0.5),
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                              //Navigator.pop(context); // Close the drawer
                            });
                          },
                          selected: _selectedIndex == index,
                        ),
                      );
                    },
                  ),
                ),

                // Main content area goes here
                Column(
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
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.width * 0.4,
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
                                        MediaQuery.of(context).size.width * 0.4,
                                    width: 400,
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
                        width: 317,
                        height: 525, // Set a specific height for the Container

                        // Example of a GridView inside the Container
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          shrinkWrap: true,
                          children: [
                            for (int i = 1; i < 8; i++)
                              Container(
                                child: StoreCard(),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  //borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors
                                        .grey, // Set the color of the border
                                    width: 0.2, // Set the width of the border
                                  ),
                                ),
                              )
                          ],
                       
                        ),
                      ),
                    ),
                    //),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
