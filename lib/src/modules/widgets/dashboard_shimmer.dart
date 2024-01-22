import 'package:flutter/material.dart';

import '../../core/core.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppConstants.getAppPadding(context),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     Expanded(child: SmallCardShimmer()),
          //     SizedBox(width: 8),
          //     Expanded(child: SmallCardShimmer()),
          //     SizedBox(width: 8),
          //     Expanded(child: SmallCardShimmer()),
          //   ],
          // ),
          CustomCardShimmer(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0225,
          ),
          LargeCardShimmer(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0225,
          ),
          CustomCardShimmer(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Row(
            children: [
              Expanded(child: SmallCardShimmer()),
              SizedBox(width: 8),
              Expanded(child: SmallCardShimmer()),
              SizedBox(width: 8),
              Expanded(child: SmallCardShimmer()),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          CustomCardShimmer(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Row(
            children: [
              Expanded(child: MediumDashBoardCardShimmer()),
              SizedBox(width: 8),
              Expanded(child: MediumDashBoardCardShimmer()),
            ],
          ),

          CustomCardShimmer(),
          LargeCardShimmer(),
          CustomCardShimmer(),
          Row(
            children: [
              Expanded(child: CustomCardShimmer(height: 40)),
              SizedBox(width: 8),
              Expanded(child: CustomCardShimmer(height: 40)),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomCardShimmer(height: 40)),
              SizedBox(width: 8),
              Expanded(child: CustomCardShimmer(height: 40)),
            ],
          ),
        ],
      ),
    );
  }
}
