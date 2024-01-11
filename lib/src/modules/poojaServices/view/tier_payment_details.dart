import 'package:flutter/material.dart';
import 'package:stoxhero/src/app/app.dart';

class TierWisePaymentDetails extends StatefulWidget {
  const TierWisePaymentDetails({Key? key}) : super(key: key);

  @override
  _TierWisePaymentDetailsState createState() => _TierWisePaymentDetailsState();
}

class _TierWisePaymentDetailsState extends State<TierWisePaymentDetails>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
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
              tabs: [
                Tab(
                  text: "${FormatHelper.formatNumbers(751, decimal: 0)}",
                ),
                Tab(text: "${FormatHelper.formatNumbers(1100, decimal: 0)}"),
                Tab(text: "${FormatHelper.formatNumbers(2100, decimal: 0)}"),
                Tab(text: "${FormatHelper.formatNumbers(2551, decimal: 0)}"),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: TabBarView(
              controller: tabController,
              children: [
                Tier1Details(),
                Tier2Details(),
                Tier3Details(),
                Tier4Details()
              ],
            ),
          )
        ],
      ),
    );
  }
}

final GlobalKey<_TierWisePaymentDetailsState> tierWiseKey =
    GlobalKey<_TierWisePaymentDetailsState>();
