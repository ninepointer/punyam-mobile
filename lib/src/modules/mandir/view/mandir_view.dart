import 'package:flutter/material.dart';
import '../../../app/app.dart';
import "package:dotted_line/dotted_line.dart";

class MandirView extends StatefulWidget {
  const MandirView({Key? key}) : super(key: key);

  @override
  _MandirViewState createState() => _MandirViewState();
}

class _MandirViewState extends State<MandirView> {
  late MandirController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find<MandirController>();
    // controller.loadData();
    // controller.getCarousel();
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
            // controller.loadData();
            // controller.getCarousel();
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
                    CommonTextField(
                      // controller: controller.searchTextController,
                      padding: EdgeInsets.zero,
                      hintText: 'Search Symbol and start trading',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: controller.searchTextController.clear,
                      ),
                      // onChanged: controller.searchInstruments,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Discover with God/Goddess",
                          style: AppStyles.tsBlackRegular18,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          godImage(
                              image: AppImages.templeImage, context: context),
                          SizedBox(
                            width: 8,
                          ),
                          godImage(
                              image: AppImages.templeImage, context: context),
                          SizedBox(
                            width: 8,
                          ),
                          godImage(
                              image: AppImages.templeImage, context: context),
                          SizedBox(
                            width: 8,
                          ),
                          godImage(
                              image: AppImages.templeImage, context: context),
                          SizedBox(
                            width: 8,
                          ),
                          godImage(
                              image: AppImages.templeImage, context: context),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => MandirDetailsView());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: mandirCard(
                                image: AppImages.templeImage,
                                mandirName: "Hanuman Mandir",
                                godName: "Hanuman Ji",
                                imageWidth: MediaQuery.of(context).size.width,
                                morningTime: "6:00AM to 12:00PM",
                                eveningTime: "4:00PM to 9:00PM",
                                address: "Pratap Nagar Jaipur"),
                          ),
                        )
                      ],
                    )
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

Widget mandirCard({
  required String image,
  required String mandirName,
  required String godName,
  required String morningTime,
  required String eveningTime,
  required String address,
  required double imageWidth,
}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(
        color: AppColors.brandYellow.withOpacity(1.0),
      ),
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Adjust the shadow color
          spreadRadius: 2, // Adjust the spread radius
          blurRadius: 5, // Adjust the blur radius
          offset: Offset(0, 3), // Adjust the shadow position
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
            width: imageWidth,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(mandirName, style: AppStyles.tsBlackMedium18),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$morningTime     |",
                style: AppStyles.tsBlackMedium12,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "$eveningTime",
                style: AppStyles.tsBlackMedium12,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$address",
                style: AppStyles.tsBlackMedium12,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                godName,
                style: AppStyles.tsBlackMedium14
                    .copyWith(color: AppColors.cinnamonStickColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        )
      ],
    ),
  );
}

Widget godImage({
  required String image,
  required BuildContext context,
}) {
  return Container(
    height: 70,
    width: MediaQuery.of(context).size.width * 0.178,
    decoration: BoxDecoration(
      // color: AppColors.white,
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.grey.withOpacity(.25),
      ),
    ),
    child: ClipOval(
        child: Image.asset(
      image,
      fit: BoxFit.cover,
    )),
  );
}
