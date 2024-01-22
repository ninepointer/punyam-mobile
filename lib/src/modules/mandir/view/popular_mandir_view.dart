import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../../app/app.dart';

class PopularMandirView extends GetView<MandirController> {
  const PopularMandirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Popular Mandirs'),
        ),
        body: Padding(
          padding: AppConstants.getAppPadding(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: controller.carouselListforPopular.length,
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
                            "${controller.carouselListforPopular[index].carouselImage}",
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
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () async {
                    // Open the SearchBottomSheet when the container is tapped
                    await Get.to(
                      () => PopularMandirSearchView(),
                    );
                    controller.popularTempleListByDistanceSearchDetails.clear();
                    controller.popularMandirsearchTextController.clear();
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Search mandir here... ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                controller.popularTempleListByDistanceDetails.isEmpty
                    ? NoDataFound()
                    : Column(
                        children: controller.popularTempleListByDistanceDetails
                            .map((templeDetails) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => MandirNearMeDetailsView(
                                    templeDetails: templeDetails,
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 12),
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color:
                                        AppColors.brandYellow.withOpacity(1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(15.0),
                                        topRight: const Radius.circular(15.0),
                                      ),
                                      child: Container(
                                        height: 180,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          templeDetails.coverImage?.url ?? '',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              templeDetails.name.toString(),
                                              style: AppStyles.tsBlackMedium18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Open time in Morning- ${FormatHelper.formatTimeOnly(templeDetails.morningOpeningTime)} to ${FormatHelper.formatTimeOnly(templeDetails.morningClosingTime)}",
                                            style: AppStyles.tsBlackMedium12,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Open time in Evening- ${FormatHelper.formatTimeOnly(templeDetails.eveningOpeningTime)} to ${FormatHelper.formatTimeOnly(templeDetails.eveningClosingTime)}",
                                            style: AppStyles.tsBlackMedium12,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "${templeDetails.addressDetails!.address}, ${templeDetails.addressDetails!.city}, ${templeDetails.addressDetails!.state}",
                                                style:
                                                    AppStyles.tsBlackMedium12,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: DottedLine(
                                        direction: Axis.horizontal,
                                        alignment: WrapAlignment.center,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${templeDetails.deviDevta}",
                                            style: AppStyles.tsBlackMedium14
                                                .copyWith(
                                              color:
                                                  AppColors.cinnamonStickColor,
                                            ),
                                          ),
                                          Text(
                                            "Distance: ${((templeDetails.distance!) / 1000).toStringAsFixed(2)} km",
                                            style: AppStyles.tsBlackMedium14
                                                .copyWith(
                                              color:
                                                  AppColors.cinnamonStickColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
