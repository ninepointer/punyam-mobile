import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class BookingView extends StatefulWidget {
  const BookingView({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final ScrollController _scrollController = ScrollController();
  late PoojaServicesController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<PoojaServicesController>();
  }

  String formatDuration(int? minutes) {
    if (minutes == null) {
      return 'N/A'; // Or any default value for null durations
    }

    if (minutes < 60) {
      return '$minutes minutes';
    } else {
      int hours = minutes ~/ 60;
      int remainingMinutes = minutes % 60;
      if (remainingMinutes == 0) {
        return '$hours hours';
      } else {
        return '$hours hours $remainingMinutes minutes';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pooja Details"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: AppConstants.getAppPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${controller.selectedPoojaById.value.name ?? ''}",
                            style: AppStyles.tsBlackMedium20,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      child: Image.network(
                        controller.selectedPoojaById.value.image?.url ?? '',
                        fit: BoxFit.fill,
                        height: 220,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.selectedPoojaById.value.subCategory ==
                          "General Pooja")
                        Text(
                          "About Pooja",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Festival Pooja")
                        Text(
                          "About Festival Pooja",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Jaap")
                        Text(
                          "About Jaap",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Paath")
                        Text(
                          "About Paath",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    child: Text(
                      "${controller.selectedPoojaById.value.description}",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.selectedPoojaById.value.subCategory ==
                          "General Pooja")
                        Text(
                          "Pooja Duration",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Festival Pooja")
                        Text(
                          "Pooja Duration",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Jaap")
                        Text(
                          "Jaap Duration",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Paath")
                        Text(
                          "Paath Duration",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 15,
                        color: AppColors.orangeColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          "${formatDuration(controller.selectedPoojaById.value.duration)}"),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         width: MediaQuery.of(context).size.width -
                  //             MediaQuery.of(context).size.width / 5,
                  //         child: imageGallery(image: AppImages.homepuja),
                  //       ),
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width * 0.05,
                  //       ),
                  //       Container(
                  //         width: MediaQuery.of(context).size.width -
                  //             MediaQuery.of(context).size.width / 5,
                  //         child: imageGallery(image: AppImages.homepuja),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width * 0.05,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.selectedPoojaById.value.subCategory ==
                          "General Pooja")
                        Text(
                          "Purpose Of Pooja",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Festival Pooja")
                        Text(
                          "Purpose Of Pooja",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Jaap")
                        Text(
                          "Purpose Of Jaap",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Paath")
                        Text(
                          "Purpose Of Paath",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.selectedPoojaById.value.purpose?.length ??
                              0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: AppColors.orangeColor,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Flexible(
                                  child: Text(
                                    controller.selectedPoojaById.value
                                        .purpose![index],
                                    style: AppStyles.tsBlackRegular14,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Benefits",
                        style: AppStyles.tsBlackMedium24.copyWith(
                          color: AppColors.brandYellow,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.selectedPoojaById.value.benefits
                              ?.map(
                                (entry) => Container(
                                  width: MediaQuery.of(context).size.width -
                                      MediaQuery.of(context).size.width / 5,
                                  margin: EdgeInsets.only(right: 12),
                                  child: benfitCard(
                                    title: entry.header.toString(),
                                    details: entry.description.toString(),
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.selectedPoojaById.value.subCategory ==
                          "General Pooja")
                        Text(
                          "Pooja Items",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Festival Pooja")
                        Text(
                          "Pooja Items",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Jaap")
                        Text(
                          "Jaap Items",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Paath")
                        Text(
                          "Paath Items",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.selectedPoojaById.value.items?.length ?? 0,
                      itemBuilder: (context, index) {
                        var item = controller.selectedPoojaById.value.items;
                        return Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: AppColors.orangeColor,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Flexible(
                                  child: Text(
                                    "${item![index].name} - ${item[index].quantity} ${item[index].unit}",
                                    style: AppStyles.tsBlackRegular14,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  TierWisePaymentDetails(
                    key: tierWiseKey,
                    packages: controller.selectedPoojaById.value.packages,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.125,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.chiveColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text("Need Help?"),
              onPressed: () {
                SnackbarHelper.showSnackbar(
                    "For additional help or queries, please feel free to reach out to us at pooja@punyam.app.");
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.cinnamonStickColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text("View packages"),
              onPressed: () {
                if (tierWiseKey.currentContext != null) {
                  Scrollable.ensureVisible(
                    tierWiseKey.currentContext!,
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 300),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget imageGallery({required String image}) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: Container(
      height: 220,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget benfitCard({
  required String title,
  required String details,
}) {
  return Container(
    height: 220,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImages.templeBackGroundImage),
        fit: BoxFit.fill,
      ),
      color: AppColors.orangeColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppStyles.tsBlackMedium20.copyWith(
                  color: AppColors.cinnamonStickColor,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: Text(
              details,
              softWrap: true,
              textAlign: TextAlign.center,
              style: AppStyles.tsBlackRegular12.copyWith(
                color: AppColors.cinnamonStickColor,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
