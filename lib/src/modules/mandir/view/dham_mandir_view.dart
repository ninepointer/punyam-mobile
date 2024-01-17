import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../../app/app.dart';

class DhamMandirView extends GetView<MandirController> {
  const DhamMandirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dhams'),
      ),
      body: Padding(
        padding: AppConstants.getAppPadding(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: controller.carouselListforMandir.length,
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
                          "${controller.carouselListforMandir[index].carouselImage}",
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
              SizedBox(height: 12),
              // CommonTextField(
              //   padding: EdgeInsets.zero,
              //   hintText: 'Search Symbol and start trading',
              //   prefixIcon: Icon(Icons.search),
              //   suffixIcon: IconButton(
              //     icon: Icon(Icons.close),
              //     onPressed: controller.searchTextController.clear,
              //   ),
              // ),
              // SizedBox(height: 12),
              Column(
                children: controller.dhamTempleListDetails.map((templeDetails) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => MandirDetailsView(
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
                            color: AppColors.brandYellow.withOpacity(1.0),
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
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  templeDetails.coverImage?.url ?? '',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                            SizedBox(height: 6),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Open time in  Morning- ${FormatHelper.formatTimeOnly(templeDetails.morningOpeningTime)} to ${FormatHelper.formatTimeOnly(templeDetails.morningClosingTime)}",
                                    style: AppStyles.tsBlackMedium12,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Open time in Evening- ${FormatHelper.formatTimeOnly(templeDetails.eveningOpeningTime)} to ${FormatHelper.formatTimeOnly(templeDetails.eveningClosingTime)}",
                                    style: AppStyles.tsBlackMedium12,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      "${templeDetails.addressDetails!.address}, ${templeDetails.addressDetails!.city}, ${templeDetails.addressDetails!.state}",
                                      style: AppStyles.tsBlackMedium12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 6),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: DottedLine(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.center,
                              ),
                            ),
                            SizedBox(height: 6),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${templeDetails.deviDevta?.name}",
                                    style: AppStyles.tsBlackMedium14.copyWith(
                                      color: AppColors.cinnamonStickColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
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
    );
  }
}
