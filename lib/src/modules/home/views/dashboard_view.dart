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
    print("${controller.dashboardCarouselList.length}");
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
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: double.infinity,
                      child: CarouselSlider.builder(
                        itemCount: controller.dashboardCarouselList.length,
                        itemBuilder: (context, int index, _) {
                          return GestureDetector(
                            onTap: () => controller.navigateToCarousel(
                              controller.dashboardCarouselList[index]
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
                                  "${controller.dashboardCarouselList[index].carouselImage}",
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
                              Get.to(() => MandirView());
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
                          GestureDetector(
                            onTap: () {
                              // Get.to(() => PoojaServicesView());
                            },
                            child: boxCard(
                                label: "Recycle",
                                subTitle: "Pooja samagri",
                                image: AppImages.recycle,
                                context: context),
                          )
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
                      child: Row(
                        children: [
                          poojaServiceCard(
                            label: "New Vehicle Pooja",
                            price: 1100,
                            image: AppImages.newCar,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0625,
                          ),
                          poojaServiceCard(
                            label: "Griha Pravesh Pooja",
                            price: 2100,
                            image: AppImages.newHome,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0625,
                          ),
                          poojaServiceCard(
                            label: "New Vehicle Pooja",
                            price: 1500,
                            image: AppImages.shopping,
                          ),
                        ],
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
                      label: "Popular Temples Near Me",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          poojaServiceCard(
                            label: "Mathura Dham",
                            price: 21000,
                            image: AppImages.mathuraMandir,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0625,
                          ),
                          poojaServiceCard(
                            label: "Triputi Balaji Dham",
                            price: 11000,
                            image: AppImages.tirupatiBalaji,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    CommonTile(
                      label: "Dham",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                        children: [
                          poojaServiceCard(
                            label: "New Vehicle Pooja",
                            price: 1100,
                            image: AppImages.newCar,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0625,
                          ),
                          poojaServiceCard(
                            label: "Griha Pravesh Pooja",
                            price: 2100,
                            image: AppImages.newHome,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0625,
                          ),
                          poojaServiceCard(
                            label: "New Vehicle Pooja",
                            price: 1500,
                            image: AppImages.shopping,
                          ),
                        ],
                      ),
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
    required String image,
    required String label,
    required num price,
    Color? valueColor,
  }) {
    return Container(
      // height: MediaQuery.of(context).size.width * 0.75,
      width: MediaQuery.of(context).size.width * 0.50,
      // margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
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
              child: Image.asset(
                image,
                fit: BoxFit.cover,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Starting ${FormatHelper.formatNumbers(price, decimal: 0)}",
                  style: AppStyles.tsBlackMedium14,
                ),
              ],
            ),
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
  required String subTitle,
  required BuildContext context,
  Color? valueColor,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.25,
    height: 100,
    padding: EdgeInsetsDirectional.all(5),
    decoration: BoxDecoration(
      color: AppColors.white,
      // border: Border.all(
      //   color: AppColors.brandYellow.withOpacity(1.0),
      // ),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0, 3),
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
