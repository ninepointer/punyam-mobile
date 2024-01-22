import 'package:flutter/material.dart';

import '../../core/core.dart';

class PoojaViewShimmer extends StatelessWidget {
  const PoojaViewShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppConstants.getAppPadding(context),
      child: Column(
        children: [
          CustomCardShimmer(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          LargeCardShimmer(),
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
              SizedBox(width: 16),
              Expanded(child: MediumDashBoardCardShimmer()),
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
              SizedBox(width: 16),
              Expanded(child: MediumDashBoardCardShimmer()),
            ],
          ),
        ],
      ),
    );
  }
}
