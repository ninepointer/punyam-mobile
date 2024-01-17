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
  late SelectedPoojaByIdData selectedPoojaByIdData;
  @override
  void initState() {
    super.initState();
    controller = Get.find<PoojaServicesController>();
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    print("rrrrr ${controller.carouselListforPooja.length}");
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
                    height: MediaQuery.of(context).size.width * 0.0625,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      itemCount: controller.carouselListforPooja.length,
                      itemBuilder: (context, int index, _) {
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              "${controller.carouselListforPooja[index].carouselImage}",
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.width * 0.4,
                              width: double.infinity,
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
                  CommonTile(
                    label: "General Pooja",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.0625,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Container(
                      child: Row(
                        children: controller.poojaCatagoryGenralPooja
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;

                          return Row(
                            children: [
                              homeServiceCard(
                                product: entry.value,
                                context: context,
                                onpress: () async {
                                  await controller.increasePoojaCountDetails(
                                      entry.value.sId);
                                  await controller
                                      .getindividualPoojaByIdDetails(
                                          entry.value.sId.toString());

                                  Get.to(() => BookingView());
                                },
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0625,
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
                  CommonTile(
                    label: "Jaap",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.0625,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Container(
                      child: Row(
                        children: controller.poojaCatagoryJaap
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;

                          return Row(
                            children: [
                              homeServiceCard(
                                product: entry.value,
                                context: context,
                                onpress: () async {
                                  await controller.increasePoojaCountDetails(
                                      entry.value.sId);
                                  await controller
                                      .getindividualPoojaByIdDetails(
                                          entry.value.sId.toString());

                                  Get.to(() => BookingView());
                                },
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0625,
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
                  CommonTile(
                    label: "Paath",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.0625,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Container(
                      child: Row(
                        children: controller.poojaCatagoryPaath
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;

                          return Row(
                            children: [
                              homeServiceCard(
                                product: entry.value,
                                context: context,
                                onpress: () async {
                                  await controller.increasePoojaCountDetails(
                                      entry.value.sId);
                                  await controller
                                      .getindividualPoojaByIdDetails(
                                          entry.value.sId.toString());

                                  Get.to(() => BookingView());
                                },
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0625,
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
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
  required PoojaCategoryData product,
  required BuildContext context,
  required Function onpress,
}) {
  return GestureDetector(
    onTap: () {
      onpress();
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.60,
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
        borderRadius: BorderRadius.circular(10.0),
      ),
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
                product.image!
                    .url!, // Assuming PoojaCategoryData has an Image property
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.54, // Adjust the width
                  child: Text(
                    product.name ?? '',
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
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Starting ${FormatHelper.formatNumbers(1100, decimal: 0)}",
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
