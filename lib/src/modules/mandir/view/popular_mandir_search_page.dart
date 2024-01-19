import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../../app/app.dart';

class PopularMandirSearchView extends GetView<MandirController> {
  const PopularMandirSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Search Popular Mandir'),
        ),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: AppConstants.getAppPadding(context),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      color: Theme.of(context).cardColor,
                      padding: const EdgeInsets.all(8).copyWith(
                        top: 0,
                      ),
                      child: CommonTextField(
                        padding: EdgeInsets.zero,
                        hintText: 'Search Mandir here',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            controller.popularMandirsearchTextController
                                .clear();
                            controller.popularTempleListByDistanceSearchDetails
                                .clear();
                          },
                        ),
                        onChanged: (query) {
                          controller.getPopularTamplesByDistanceDetails(
                              searchQuery: query);
                          if (query == "") {
                            controller.popularTempleListByDistanceSearchDetails
                                .clear();
                          }
                        },
                        controller:
                            controller.popularMandirsearchTextController,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.0625,
                    ),
                    controller.popularTempleListByDistanceSearchDetails.isEmpty
                        ? NoDataFound()
                        : Column(
                            children: controller
                                .popularTempleListByDistanceSearchDetails
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
                                        color: AppColors.brandYellow
                                            .withOpacity(1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0),
                                          ),
                                          child: Container(
                                            height: 180,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Image.network(
                                              templeDetails.coverImage?.url ??
                                                  '',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 6),
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
                                                  style:
                                                      AppStyles.tsBlackMedium18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Open time in  Morning- ${FormatHelper.formatTimeOnly(templeDetails.morningOpeningTime)} to ${FormatHelper.formatTimeOnly(templeDetails.morningClosingTime)}",
                                                style:
                                                    AppStyles.tsBlackMedium12,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Open time in Evening- ${FormatHelper.formatTimeOnly(templeDetails.eveningOpeningTime)} to ${FormatHelper.formatTimeOnly(templeDetails.eveningClosingTime)}",
                                                style:
                                                    AppStyles.tsBlackMedium12,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "${templeDetails.addressDetails!.address}, ${templeDetails.addressDetails!.city}, ${templeDetails.addressDetails!.state}",
                                                  style:
                                                      AppStyles.tsBlackMedium12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: DottedLine(
                                            direction: Axis.horizontal,
                                            alignment: WrapAlignment.center,
                                          ),
                                        ),
                                        SizedBox(height: 6),
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
                                                  color: AppColors
                                                      .cinnamonStickColor,
                                                ),
                                              ),
                                              Text(
                                                "Distance: ${((templeDetails.distance!) / 1000).toStringAsFixed(2)} km",
                                                style: AppStyles.tsBlackMedium14
                                                    .copyWith(
                                                  color: AppColors
                                                      .cinnamonStickColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0625,
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
        ),
      ),
    );
  }
}
