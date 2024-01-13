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
    print(controller.poojaCatagoryGenralPooja.length);
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
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      itemCount: controller.dashboardCarouselList.length,
                      itemBuilder: (context, int index, _) {
                        return Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              "${controller.dashboardCarouselList[index].carouselImage}",
                              fit: BoxFit.fill,
                              height: 100,
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
                    child: Container(
                      child: Row(
                        children: controller.poojaCatagoryGenralPooja
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;

                          return homeServiceCard(
                            product: entry.value,
                            context: context,
                            onpress: () async {
                              await controller.getindividualPoojaByIdDetails(
                                  entry.value.sId.toString());

                              Get.to(() => BookingView());
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(children: [
                  //     homeServiceCard(
                  //         context: context,
                  //         image: AppImages.newHome,
                  //         label: "Home Pooja",
                  //         price: 5100),
                  //     SizedBox(
                  //       width: 12,
                  //     ),
                  //     homeServiceCard(
                  //         context: context,
                  //         image: AppImages.newCar,
                  //         label: "Car Pooja",
                  //         price: 1100),
                  //   ]),
                  // ),

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
                    child: Container(
                      child: Row(
                        children: controller.poojaCatagoryJaap
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;

                          return homeServiceCard(
                            product: entry.value,
                            context: context,
                            onpress: () async {
                              await controller.getindividualPoojaByIdDetails(
                                  entry.value.sId.toString());

                              Get.to(() => BookingView());
                            },
                          );
                        }).toList(),
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
  required PoojaCategoryData product,
  required BuildContext context,
  required Function onpress,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.50,
    padding: EdgeInsetsDirectional.all(6),
    margin: EdgeInsets.only(right: 20),
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
          width: MediaQuery.of(context).size.width * 0.575,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Image.network(
                product.image!
                    .url!, // Assuming PoojaCategoryData has an Image property
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(product.name ?? '', style: AppStyles.tsBlackMedium18),
          ],
        ),
        SizedBox(height: 8),
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
                  onpress();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  backgroundColor: AppColors.cinnamonStickColor,
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
}
