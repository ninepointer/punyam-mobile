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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
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
                    height: 12,
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
                    height: 12,
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
                          "Jaap")
                        Text(
                          "About Jaap",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    child: Text(
                      "${controller.selectedPoojaById.value.description}",
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width / 5,
                          child: imageGallery(image: AppImages.homepuja),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width / 5,
                          child: imageGallery(image: AppImages.homepuja),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.selectedPoojaById.value.subCategory ==
                          "Jaap")
                        Text(
                          "Purpose of Jaap",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      if (controller.selectedPoojaById.value.subCategory ==
                          "General Pooja")
                        Text(
                          "Purpose of Pooja",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
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
                    height: 12,
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
                    height: 12,
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
                    height: 12,
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
                          "Jaap")
                        Text(
                          "Jaap Items",
                          style: AppStyles.tsBlackMedium24.copyWith(
                            color: AppColors.brandYellow,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
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
                    height: 12,
                  ),
                  TierWisePaymentDetails(
                    key: tierWiseKey,
                    packages: controller.selectedPoojaById.value.packages,
                  ),
                  SizedBox(
                    height: 112,
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
                // Handle the button press
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
