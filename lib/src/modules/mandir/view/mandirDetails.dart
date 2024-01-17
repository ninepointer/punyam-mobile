import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class MandirDetailsView extends StatefulWidget {
  final AllMandirData? templeDetails;

  const MandirDetailsView({
    Key? key,
    this.templeDetails,
  }) : super(key: key);

  @override
  State<MandirDetailsView> createState() => _MandirDetailsViewState();
}

class _MandirDetailsViewState extends State<MandirDetailsView>
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
    return Scaffold(
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
                                controller.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline_outlined,
                              ),
                              onPressed: () {
                                setState(() {
                                  // Toggle the favorite status
                                  controller.isFavorite =
                                      !controller.isFavorite;
                                  // Call the addFaviroutesMandir function with the mandirid
                                  controller.addFaviroutesMandir(
                                    widget.templeDetails?.sId,
                                  );
                                });
                              },
                              color: controller.isFavorite
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                          // SizedBox(
                          //   width: 12,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 40,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     color: Colors.white,
                          //   ),
                          //   child: IconButton(
                          //     iconSize: 20,
                          //     icon: Icon(Icons.share),
                          //     onPressed: () => {},
                          //     color: Colors.black,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                mandirDetailsCard(
                  mandirName: "${widget.templeDetails?.name}",
                  godName: "${widget.templeDetails?.deviDevta?.name}",
                  morningTime:
                      " ${FormatHelper.formatTimeOnly(widget.templeDetails?.morningOpeningTime)} to ${FormatHelper.formatTimeOnly(widget.templeDetails?.morningClosingTime)}",
                  eveningTime:
                      " ${FormatHelper.formatTimeOnly(widget.templeDetails?.eveningOpeningTime)} to ${FormatHelper.formatTimeOnly(widget.templeDetails?.eveningClosingTime)}",
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
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          MandirDetailsAboutWidget(
                              templeDetails: widget.templeDetails),
                          MandirDetailsPhtosWidget(
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
    );
  }
}

Widget mandirDetailsCard({
  required String mandirName,
  required String godName,
  required String morningTime,
  required String eveningTime,
  required String address,
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
              Text(
                "$morningTime |",
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
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  address,
                  style: AppStyles.tsBlackMedium12,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.directions_outlined,
                color: AppColors.cinnamonStickColor,
              ),
              height: 20,
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ],
    ),
  );
}
