import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../app/app.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late HomeController controller;
  late PoojaServicesController poojaServicesController;
  late MandirController mandirController;
  late List<String> monthsList;

  String? selectedValue2 = '';

  @override
  void initState() {
    super.initState();
    controller = Get.find<HomeController>();
    controller.getUserCurrentLocation();
    controller.loadData();
    poojaServicesController = Get.find<PoojaServicesController>();
    mandirController = Get.find<MandirController>();

    poojaServicesController.loadData();
    mandirController.loadData();
    mandirController.getNearByMandirsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            controller.getUserCurrentLocation();
            controller.loadData();
            poojaServicesController.loadData();
            return Future.value();
          },
          child: Visibility(
            visible: !controller.isLoadingStatus,
            replacement: DashboardShimmer(),
            child: SingleChildScrollView(
              child: Padding(
                padding: AppConstants.getAppPadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTile(
                      label: "Trending Now",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: double.infinity,
                      child: CarouselSlider.builder(
                        itemCount: controller.carouselListforHome.length,
                        itemBuilder: (context, int index, _) {
                          return GestureDetector(
                            onTap: () => controller.navigateToCarousel(
                              controller.carouselListforHome[index]
                                      .linkToCarousel ??
                                  '',
                            ),
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
                                  "${controller.carouselListforHome[index].carouselImage ?? ''}",
                                  fit: BoxFit.fill,
                                  height:
                                      MediaQuery.of(context).size.width * 0.4,
                                  width: double.infinity,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          "Explore",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.selectedIndex(1);
                              Get.find<MandirController>().loadData();
                            },
                            child: boxCard(
                                label: "Mandir",
                                subTitle: "Near me",
                                image: AppImages.mandir1,
                                context: context),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => PoojaServicesView());
                            },
                            child: boxCard(
                                label: "Pooja",
                                subTitle: "Book at home",
                                image: AppImages.pooja1,
                                context: context),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.to(() => PoojaServicesView());
                              SnackbarHelper.showSnackbar("Coming soon");
                            },
                            child: boxCard(
                                label: "Store",
                                subTitle: "Order samagri",
                                image: AppImages.product1,
                                context: context),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     // Get.to(() => PoojaServicesView());
                          //   },
                          //   child: boxCard(
                          //       label: "Recycle",
                          //       subTitle: "Pooja samagri",
                          //       image: AppImages.recycle,
                          //       context: context),
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    CommonTile(
                      label: "Pooja Services",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Container(
                        child: Row(
                          children: controller.homepagePoojaList
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;

                            // Use SizedBox to add space between items
                            return Row(
                              children: [
                                poojaServiceCard(
                                    label: "${entry.value.name}",
                                    price: 11000,
                                    image: AppImages.tirupatiBalaji,
                                    product: entry.value,
                                    onpress: () async {
                                      await poojaServicesController
                                          .increasePoojaCountDetails(
                                              entry.value.sId);
                                      await poojaServicesController
                                          .getindividualPoojaByIdDetails(
                                              entry.value.sId.toString());

                                      Get.to(() => BookingView());
                                    }),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.0625,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.width * 0.0625),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => PoojaServicesView());
                      },
                      child: Text(
                        "View All Pooja Services -->",
                        style: AppStyles.tsBlackMedium14.copyWith(
                          color: AppColors.brandYellow,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    CommonTile(
                      label: "Mandir Near Me",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Obx(
                        () => Container(
                          child: Row(
                            children: mandirController.nearbyMandirs
                                .asMap()
                                .entries
                                .map((entry) {
                              int index = entry.key;

                              return Row(
                                children: [
                                  mandirCard(
                                    label: "${entry.value.name}",
                                    price: 11000,
                                    product: entry.value,
                                    onpress: () {
                                      Get.to(() => MandirNearMeDetailsView(
                                            templeDetails: entry.value,
                                          ));
                                    },
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.0625,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    // CommonTile(
                    //   label: "Popular Mandir Near Me",
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.width * 0.0625,
                    // ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   clipBehavior: Clip.none,
                    //   child: Obx(
                    //     () => Container(
                    //       child: Row(
                    //         children: mandirController.nearbyMandirs
                    //             .asMap()
                    //             .entries
                    //             .map((entry) {
                    //           int index = entry.key;

                    //           return Row(
                    //             children: [
                    //               mandirCard(
                    //                 label: "${entry.value.name}",
                    //                 price: 11000,
                    //                 product: entry.value,
                    //                 onpress: () {
                    //                   Get.to(() => MandirNearMeDetailsView(
                    //                         templeDetails: entry.value,
                    //                       ));
                    //                 },
                    //               ),
                    //               SizedBox(
                    //                 width: MediaQuery.of(context).size.width *
                    //                     0.0625,
                    //               ),
                    //             ],
                    //           );
                    //         }).toList(),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.width * 0.0625,
                    // ),
                    CommonTile(
                      label: "Dham",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Container(
                        child: Row(
                          children: mandirController.dhamTempleListDetails
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;

                            return Row(
                              children: [
                                dhamMandirCard(
                                  label: "${entry.value.name}",
                                  price: 11000,
                                  product: entry.value,
                                  onpress: () {
                                    Get.to(() => MandirDetailsView(
                                          templeDetails: entry.value,
                                        ));
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.0625,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget poojaServiceCard({
    required PoojaCategoryData product,
    required String image,
    required String label,
    required num price,
    Color? valueColor,
    required Function onpress,
  }) {
    return GestureDetector(
      onTap: () {
        onpress();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  product.image!.url ?? '',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(label,
                      style: AppStyles.tsBlackRegular16.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.orangeColor)),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Starting ${FormatHelper.formatNumbers(price, decimal: 0)}",
                    style: AppStyles.tsBlackMedium14,
                  ),
                  Text(
                    "Book Now",
                    style: AppStyles.tsBlackMedium14
                        .copyWith(color: AppColors.orangeColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget mandirCard({
    required TempleNearByMeList product,
    required String label,
    required num price,
    required Function onpress,
    Color? valueColor,
  }) {
    return GestureDetector(
      onTap: () {
        onpress(); // Call the function when tapped
      },
      child: Container(
        // height: MediaQuery.of(context).size.width * 0.75,
        width: MediaQuery.of(context).size.width * 0.6,
        // margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  product.coverImage!.url ?? "",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.50, // Adjust the width
                    child: Text(
                      label,
                      style: AppStyles.tsBlackRegular16.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.orangeColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Distance: ${(product.distance! / 1000).toStringAsFixed(2)} km",
                    style: AppStyles.tsBlackMedium14,
                  ),
                  Text(
                    "View",
                    style: AppStyles.tsBlackMedium14
                        .copyWith(color: AppColors.orangeColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget dhamMandirCard({
    required AllMandirData product,
    required String label,
    required num price,
    Color? valueColor,
    required Function onpress,
  }) {
    return GestureDetector(
      onTap: () {
        onpress(); // Call the function when tapped
      },
      child: Container(
        // height: MediaQuery.of(context).size.width * 0.75,
        width: MediaQuery.of(context).size.width * 0.6,
        // margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  product.coverImage!.url ?? "",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.50, // Adjust the width
                    child: Text(
                      label,
                      style: AppStyles.tsBlackRegular16.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.orangeColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${(product.deviDevta?.name)}",
                    style: AppStyles.tsBlackMedium14,
                  ),
                  Text(
                    "View",
                    style: AppStyles.tsBlackMedium14
                        .copyWith(color: AppColors.orangeColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

Widget boxCard({
  required String image,
  required String label,
  required String subTitle,
  required BuildContext context,
  Color? valueColor,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.25,
    height: MediaQuery.of(context).size.width * 0.27,
    padding: EdgeInsetsDirectional.all(5),
    decoration: BoxDecoration(
      color: AppColors.white,
      // border: Border.all(
      //   color: AppColors.brandYellow.withOpacity(1.0),
      // ),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ],
    ),
    child: Column(
      children: [
        SizedBox(
          height: 4,
        ),
        Container(
          height: MediaQuery.of(context).size.width * 0.11,
          width: MediaQuery.of(context).size.width * 0.11,
          child: Padding(
              padding: EdgeInsets.all(2),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              )),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          label,
          style:
              AppStyles.tsBlackMedium16.copyWith(color: AppColors.orangeColor),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          subTitle,
          style: AppStyles.tsGreyMedium10,
        ),
        SizedBox(
          height: 4,
        ),
      ],
    ),
  );
}
