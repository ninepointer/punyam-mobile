import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class MandirNearMeDetailsView extends StatefulWidget {
  final TempleNearByMeList? templeDetails;

  const MandirNearMeDetailsView({
    Key? key,
    this.templeDetails,
  }) : super(key: key);

  @override
  State<MandirNearMeDetailsView> createState() =>
      _MandirNearMeDetailsViewState();
}

class _MandirNearMeDetailsViewState extends State<MandirNearMeDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late MandirController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<MandirController>();
    controller.loadData();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.templeBackGroundImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: AppColors.cinnamonStickColor,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                  iconSize: 20,
                                  icon: Icon(
                                    controller.isFavorite.isTrue
                                        ? Icons.favorite
                                        : Icons.favorite_outline_outlined,
                                  ),
                                  onPressed: () async {
                                    await controller.addFaviroutesMandir(
                                        widget.templeDetails?.sId);
                                  },
                                  color: controller.isFavorite.value
                                      ? Colors.red
                                      : Colors.black),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                iconSize: 20,
                                icon: Icon(Icons.share),
                                onPressed: () => {},
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  nearBymemandirDetailsCard(
                    onpress: () async {
                      num endLat = widget.templeDetails?.addressDetails
                              ?.location?.coordinates?.first ??
                          0;
                      num endLng = widget.templeDetails?.addressDetails
                              ?.location?.coordinates?.last ??
                          0;

                      await controller.getNavigateToGoogleMap(endLat, endLng);
                    },
                    morningAarti: "12",
                    eveningAarti: "13",
                    mandirName: "${widget.templeDetails?.name}",
                    godName: "${widget.templeDetails?.deviDevta}",
                    morningTime:
                        " ${FormatHelper.formatTimeOnly(widget.templeDetails?.morningOpeningTime)} - ${FormatHelper.formatTimeOnly(widget.templeDetails?.morningClosingTime)}",
                    eveningTime:
                        " ${FormatHelper.formatTimeOnly(widget.templeDetails?.eveningOpeningTime)} - ${FormatHelper.formatTimeOnly(widget.templeDetails?.eveningClosingTime)}",
                    address:
                        "${widget.templeDetails?.addressDetails!.address}, ${widget.templeDetails?.addressDetails!.city}, ${widget.templeDetails?.addressDetails!.state}",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      padding: AppConstants.getAppPadding(context),
                      child: TabBar(
                        controller: tabController,
                        indicatorColor: AppColors.cinnamonStickColor,
                        tabs: [
                          Tab(
                            child: Text(
                              'About',
                              style: Theme.of(context).textTheme.tsRegular16,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Photos',
                              style: Theme.of(context).textTheme.tsRegular16,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 12,
                    // ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            NearByMandirDetailsAboutWidget(
                                templeDetails: widget.templeDetails),
                            NaerByMandirDetailsPhtosWidget(
                                templeDetails: widget.templeDetails),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget nearBymemandirDetailsCard({
  required String mandirName,
  required String godName,
  required String morningTime,
  required String eveningTime,
  required String address,
  required String morningAarti,
  required String eveningAarti,
  required Function onpress,
}) {
  return Container(
    child: CommonCard(
      color: AppColors.white,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  mandirName,
                  style: AppStyles.tsBlackMedium20,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(
                Icons.sunny,
                size: 15,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Morning Session:   $morningTime",
                style: AppStyles.tsBlackMedium12,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(
                Icons.shield_moon_rounded,
                size: 15,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Evening Session:   $eveningTime",
                style: AppStyles.tsBlackMedium12,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "$address",
                  style: AppStyles.tsBlackMedium12,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.person_2_rounded,
                size: 15,
              ),
              Text(
                "Main Diety: ",
                style: AppStyles.tsBlackMedium14.copyWith(
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                godName,
                style: AppStyles.tsBlackMedium14.copyWith(
                  color: AppColors.cinnamonStickColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => onpress(),
                  child: Icon(
                    Icons.directions_outlined,
                    color: AppColors.cinnamonStickColor,
                  ),
                  height: 16,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get direction",
              style: AppStyles.tsBlackMedium12,
            )
          ],
        )
      ],
    ),
  );
}
