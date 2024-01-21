import 'package:flutter/material.dart';
import 'package:punyam/src/app/app.dart';

class TierWisePaymentDetails extends StatefulWidget {
  final List<Packagess>? packages;
  TierWisePaymentDetails({Key? key, this.packages}) : super(key: key);

  @override
  _TierWisePaymentDetailsState createState() => _TierWisePaymentDetailsState();
}

class _TierWisePaymentDetailsState extends State<TierWisePaymentDetails>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late PoojaServicesController controller;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.packages!.length, vsync: this);
    controller = Get.find<PoojaServicesController>();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(
                color: Colors.black,
              ),
              indicator: BoxDecoration(
                color: AppColors.orangeColor,
                border: Border.all(color: AppColors.brandYellow),
                borderRadius: BorderRadius.circular(5),
              ),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
              tabs: widget.packages?.map((package) {
                    return Tab(
                      text:
                          "${FormatHelper.formatNumbers(package.price, decimal: 0)}",
                    );
                  }).toList() ??
                  [],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: TabBarView(
              controller: tabController,
              children: widget.packages?.map((package) {
                    return Tier1Details(
                      package: package,
                      poojaId:
                          controller.selectedPoojaById.value.sId.toString(),
                    );
                  }).toList() ??
                  [],
            ),
          )
        ],
      ),
    );
  }
}

final GlobalKey<_TierWisePaymentDetailsState> tierWiseKey =
    GlobalKey<_TierWisePaymentDetailsState>();
