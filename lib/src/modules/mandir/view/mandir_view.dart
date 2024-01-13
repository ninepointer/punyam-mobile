import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:get/get.dart';
import '../../../app/app.dart';

class MandirView extends StatefulWidget {
  const MandirView({Key? key}) : super(key: key);

  @override
  _MandirViewState createState() => _MandirViewState();
}

class _MandirViewState extends State<MandirView> {
  late MandirController controller;
  late List<AllMandirData> _selectedTempleList = [];

  @override
  void initState() {
    super.initState();
    controller = Get.find<MandirController>();
    controller.loadData();
    _selectedTempleList = controller.allTempleListDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mandir"),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            controller.loadData();
            _selectedTempleList = controller.allTempleListDetails;
            return Future.value();
          },
          child: Visibility(
            visible: !controller.isLoadingStatus,
            child: Padding(
              padding: AppConstants.getAppPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextField(
                    padding: EdgeInsets.zero,
                    hintText: 'Search Symbol and start trading',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: controller.searchTextController.clear,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Discover with God/Goddess",
                        style: AppStyles.tsBlackRegular18,
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        godImage(image: AppImages.ramji, context: context),
                        SizedBox(width: 8),
                        godImage(image: AppImages.durgaji, context: context),
                        SizedBox(width: 8),
                        godImage(image: AppImages.hanumanji, context: context),
                        SizedBox(width: 8),
                        godImage(image: AppImages.shivji, context: context),
                        SizedBox(width: 8),
                        godImage(
                            image: AppImages.templeImage, context: context),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Handle button tap
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.cinnamonStickColor),
                            ),
                            child: Text(
                              "Open Now",
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
                            // Handle button tap
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
                              _selectedTempleList =
                                  controller.popularTempleListDetails;
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
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.cinnamonStickColor),
                            ),
                            child: Text(
                              "Tranding Now",
                              style: TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.31,
                            height: 70,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage(AppImages.templeBackGroundImage),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(17),
                              color: AppColors.cyan,
                            ),
                            child: Center(
                                child: Text(
                              "Popular Mandir's",
                              style: AppStyles.tsBlackMedium16,
                            )),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedTempleList =
                                  controller.popularTempleListDetails;
                            });
                          }),
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.31,
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage(AppImages.templeBackGroundImage),
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
                          setState(() {
                            _selectedTempleList =
                                controller.dhamTempleListDetails;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _selectedTempleList.length,
                      itemBuilder: (context, index) {
                        var templeDetails = _selectedTempleList[index];

                        return GestureDetector(
                          onTap: () {
                            Get.to(() => MandirDetailsView(
                                templeDetails: templeDetails));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 12), // Add margin
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          templeDetails.name.toString(),
                                          style: AppStyles.tsBlackMedium18,
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
                                          style: AppStyles.tsBlackMedium12,
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
                                          "Open time in Evening- ${FormatHelper.formatTimeOnly(templeDetails.eveningOpeningTime)} to ${FormatHelper.formatTimeOnly(templeDetails.eveningClosingTime)}",
                                          style: AppStyles.tsBlackMedium12,
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
                                        Flexible(
                                          child: Text(
                                            "${templeDetails.addressDetails!.address} ${templeDetails.addressDetails!.city}",
                                            style: AppStyles.tsBlackMedium12,
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
                                          "${templeDetails.deviDevta?.name}",
                                          style: AppStyles.tsBlackMedium14
                                              .copyWith(
                                                  color: AppColors
                                                      .cinnamonStickColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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

Widget godImage({
  required String image,
  required BuildContext context,
}) {
  return Container(
    height: 70,
    width: MediaQuery.of(context).size.width * 0.178,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.grey.withOpacity(.25),
      ),
    ),
    child: ClipOval(
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    ),
  );
}
