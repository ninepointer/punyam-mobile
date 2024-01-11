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
  late List<String> monthsList;

  String? selectedValue2 = '';

  @override
  void initState() {
    super.initState();
    controller = Get.find<HomeController>();
    poojaServicesController = Get.find<PoojaServicesController>();
    poojaServicesController.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
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
                      height: 12,
                    ),
                    // Container(
                    //   height: 150,
                    //   width: double.infinity,
                    //   child: CarouselSlider.builder(
                    //     itemCount: controller.dashboardCarouselList.length,
                    //     itemBuilder: (context, int index, _) {
                    //       return GestureDetector(
                    //         onTap: () => controller.navigateToCarousel(
                    //           controller.dashboardCarouselList[index]
                    //                   .linkToCarousel ??
                    //               '',
                    //         ),
                    //         child: Container(
                    //           width: double.infinity,
                    //           height: 100,
                    //           decoration: BoxDecoration(
                    //             color: AppColors.grey.withOpacity(.1),
                    //             borderRadius: BorderRadius.circular(8),
                    //           ),
                    //           child: ClipRRect(
                    //             borderRadius: BorderRadius.circular(8),
                    //             child: Image.network(
                    //               "${controller.dashboardCarouselList[index].carouselImage}",
                    //               fit: BoxFit.fill,
                    //               height: 100,
                    //               width: double.infinity,
                    //             ),
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
                      height: 12,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PoojaServicesView());
                          },
                          child: boxCard(
                              label: "Pooja",
                              image: AppImages.poojaservice,
                              context: context),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => MandirView());
                          },
                          child: boxCard(
                              label: "Temples",
                              image: AppImages.mandir,
                              context: context),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(() => PoojaServicesView());
                          },
                          child: boxCard(
                              label: "Products",
                              image: AppImages.shopping,
                              context: context),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CommonTile(
                      label: "Pooja Services",
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          poojaServiceCard(
                            label: "New Vehicle Pooja",
                            price: 1100,
                            image: AppImages.carPuja,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          poojaServiceCard(
                            label: "Griha Pravesh Pooja",
                            price: 1100,
                            image: AppImages.homepuja,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          poojaServiceCard(
                            label: "New Vehicle Pooja",
                            price: 1100,
                            image: AppImages.shopping,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => PoojaServicesView());
                        },
                        child: Text("View All Poojas -->",
                            style: AppStyles.tsBlackMedium14.copyWith(
                              color: AppColors.brandYellow,
                              decoration: TextDecoration.underline,
                            )))

                    //dsgd
                    //sgsg
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
    required String image,
    required String label,
    required num price,
    Color? valueColor,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.50,
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
            width: MediaQuery.of(context).size.width * 0.45,
            child: Padding(
                padding: EdgeInsets.all(2),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(label, style: AppStyles.tsBlackRegular16),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Starting ${FormatHelper.formatNumbers(1100, decimal: 0)}",
                style: AppStyles.tsBlackMedium14,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

Widget boxCard({
  required String image,
  required String label,
  required BuildContext context,
  Color? valueColor,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.28,
    height: 110,
    padding: EdgeInsetsDirectional.all(5),
    decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.brandYellow.withOpacity(1.0),
        ),
        borderRadius: BorderRadius.circular(10.0)),
    child: Column(
      children: [
        Container(
          height: 65,
          width: 100,
          child: Padding(
              padding: EdgeInsets.all(2),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              )),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: AppStyles.tsBlackMedium16,
        ),
        // SizedBox(
        //   height: 4,
        // ),
        // Text(
        //   discount,
        //   style: AppStyles.tsBlackMedium14,
        // ),
        SizedBox(
          height: 4,
        ),
      ],
    ),
  );
}
