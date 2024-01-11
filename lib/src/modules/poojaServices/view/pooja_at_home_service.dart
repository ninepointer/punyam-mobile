import 'package:flutter/material.dart';
import '../../../app/app.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PoojaAtHomeView extends StatefulWidget {
  const PoojaAtHomeView({Key? key}) : super(key: key);

  @override
  _PoojaAtHomeViewState createState() => _PoojaAtHomeViewState();
}

class _PoojaAtHomeViewState extends State<PoojaAtHomeView> {
  late PoojaServicesController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find<PoojaServicesController>();
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: () async {
          controller.loadData();
          controller.getCarousel();
          return Future.value();
        },
        child: Visibility(
          visible: !controller.isLoadingStatus,
          // replacement: DashboardShimmer(),
          child: SingleChildScrollView(
            child: Padding(
              padding: AppConstants.getAppPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTile(
                    label: "Trending Pooja",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // Container(
                  //   height: 150,
                  //   width: double.infinity,
                  //   child: CarouselSlider.builder(
                  //     itemCount: controller.dashboardCarouselList.length,
                  //     itemBuilder: (context, int index, _) {
                  //       return Container(
                  //         width: double.infinity,
                  //         height: 100,
                  //         decoration: BoxDecoration(
                  //           color: AppColors.grey.withOpacity(.1),
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //         child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(8),
                  //           child: Image.network(
                  //             "${controller.dashboardCarouselList[index].carouselImage}",
                  //             fit: BoxFit.fill,
                  //             height: 100,
                  //             width: double.infinity,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     options: CarouselOptions(
                  //       viewportFraction: 1,
                  //       autoPlay: true,
                  //       enlargeCenterPage: true,
                  //       autoPlayInterval: const Duration(seconds: 6),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 12,
                  ),
                  CommonTile(
                    label: "General Pooja",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => Container(
                        child: Row(
                          children: controller.poojaCatagoryGenralPooja
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.63,
                              // height: 160,
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsetsDirectional.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                  color: AppColors.brandYellow.withOpacity(1.0),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: MediaQuery.of(context).size.width *
                                        0.575,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.network(
                                      entry.value.image?.url ?? '',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("${entry.value.name}",
                                          style: AppStyles.tsBlackMedium18),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Starting ${FormatHelper.formatNumbers(1100, decimal: 0)}",
                                        style: AppStyles.tsBlackMedium14,
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.to(() => BookingView());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 4,
                                            ), // Adjust padding as needed
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            backgroundColor:
                                                AppColors.cinnamonStickColor,
                                          ),
                                          child: Text(
                                            "Book Now",
                                            style: AppStyles.tsWhiteMedium12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 12,
                  ),
                  CommonTile(
                    label: "Jaap",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => Container(
                        child: Row(
                          children: controller.poojaCatagoryJaap
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.63,
                              // height: 160,
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsetsDirectional.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                  color: AppColors.brandYellow.withOpacity(1.0),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: MediaQuery.of(context).size.width *
                                        0.575,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.network(
                                      entry.value.image?.url ?? '',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("${entry.value.name}",
                                          style: AppStyles.tsBlackMedium18),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Starting ${FormatHelper.formatNumbers(1100, decimal: 0)}",
                                        style: AppStyles.tsBlackMedium14,
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.to(() => BookingView());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 4,
                                            ), // Adjust padding as needed
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            backgroundColor:
                                                AppColors.cinnamonStickColor,
                                          ),
                                          child: Text(
                                            "Book Now",
                                            style: AppStyles.tsWhiteMedium12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget homeServiceCard({
  required String image,
  required String label,
  required num price,
  required BuildContext context,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.58,
    // height: 160,
    padding: EdgeInsetsDirectional.all(10),
    decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.brandYellow.withOpacity(1.0),
        ),
        borderRadius: BorderRadius.circular(10.0)),
    child: Column(
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.575,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label, style: AppStyles.tsBlackMedium18),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Starting ${FormatHelper.formatNumbers(1100, decimal: 0)}",
              style: AppStyles.tsBlackMedium14,
            ),
            SizedBox(
              height: 25,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => BookingView());
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 6, vertical: 4), // Adjust padding as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    backgroundColor: AppColors.cinnamonStickColor),
                child: Text(
                  "Book Now",
                  style: AppStyles.tsWhiteMedium12,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
