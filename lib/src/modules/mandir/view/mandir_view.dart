import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../../../app/app.dart';

class MandirView extends StatefulWidget {
  const MandirView({Key? key}) : super(key: key);

  @override
  _MandirViewState createState() => _MandirViewState();
}

class _MandirViewState extends State<MandirView> {
  late MandirController controller;
  late List<TempleNearByMeList> _selectedTempleList = [];

  @override
  void initState() {
    super.initState();
    controller = Get.find<MandirController>();
    controller.loadData();
    _selectedTempleList = controller.nearbyMandirs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Mandir"),
      // ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            controller.loadData();
            _selectedTempleList = controller.nearbyMandirs;
            return Future.value();
          },
          child: Visibility(
            visible: !controller.isLoadingStatus,
            replacement: MandirViewShimmer(),
            child: SingleChildScrollView(
              child: Padding(
                padding: AppConstants.getAppPadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: double.infinity,
                      child: CarouselSlider.builder(
                        itemCount: controller.carouselListforMandir.length,
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
                                "${controller.carouselListforMandir[index].carouselImage ?? ''}",
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
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    InkWell(
                      onTap: () async {
                        // Open the SearchBottomSheet when the container is tapped
                        await Get.to(
                          () => AllMandirSearchView(),
                        );
                        controller.nearbyMandirsSearch.clear();
                        controller.allMandirsearchTextController.clear();
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
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Discover with Devi/Devta",
                          style: AppStyles.tsBlackRegular18,
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Container(
                        child: Row(
                          children: controller.deviDevtaListDetails
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;

                            return Row(
                              children: [
                                godImage(
                                  product: entry.value,
                                  context: context,
                                  onpress: () async {
                                    await controller.getTempleByGodNameDetails(
                                        entry.value.sId.toString());

                                    Get.to(() => MandirDetailsByGodNameView(
                                        mandirByname: entry.value));
                                  },
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.045,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _selectedTempleList = controller.nearbyMandirs;
                            },
                            child: Container(
                              width: 80,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.cinnamonStickColor),
                              ),
                              child: Text(
                                "All",
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedTempleList =
                                    controller.myFaviroutesMandirs;
                                controller.getMyFaviroutesTamplesDetails();
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.cinnamonStickColor),
                              ),
                              child: Text(
                                "Favorites",
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedTempleList = controller
                                    .popularTempleListByDistanceDetails;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.cinnamonStickColor),
                              ),
                              child: Text(
                                "Popular",
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedTempleList =
                                    controller.trandingNowMandirs;
                                controller.getTrandingNowTamplesDetails();
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.cinnamonStickColor),
                              ),
                              child: Text(
                                "Trending Now",
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.31,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppImages.templeBackGroundImage),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(17),
                                color: AppColors.cyan,
                              ),
                              child: Center(
                                  child: Text(
                                "Popular Mandirs",
                                style: AppStyles.tsBlackMedium16,
                              )),
                            ),
                            onTap: () {
                              Get.to(() => PopularMandirView());
                            }),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.030,
                        ),
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.31,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppImages.templeBackGroundImage),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(17),
                                color: AppColors.cyan,
                              ),
                              child: Center(
                                  child: Text(
                                "Dham",
                                style: AppStyles.tsBlackMedium16,
                              )),
                            ),
                            onTap: () {
                              Get.to(() => DhamMandirView());
                            }),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    _selectedTempleList.isEmpty
                        ? NoDataFound()
                        : Column(
                            children: _selectedTempleList.map((templeDetails) {
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Text(
                                                    "${templeDetails.addressDetails!.address}, ${templeDetails.addressDetails!.city}, ${templeDetails.addressDetails!.state}",
                                                    style: AppStyles
                                                        .tsBlackMedium12,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
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
                                              0.05,
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

Widget godImage({
  required DeviDevtaList product,
  required BuildContext context,
  required Function onpress,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.178,
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            onpress();
          },
          child: Container(
            height: MediaQuery.of(context).size.width * 0.178,
            width: MediaQuery.of(context).size.width * 0.178,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.grey.withOpacity(.25),
              ),
              image: DecorationImage(
                image: NetworkImage(product.image!.url ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          child: Text(
            "${product.name}",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.tsBlackRegular12,
          ),
        ),
      ],
    ),
  );
}
