import 'package:flutter/material.dart';

import '../../core/core.dart';

class BookingOrderShimmer extends StatelessWidget {
  const BookingOrderShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppConstants.getAppPadding(context),
      child: Column(
        children: [
          CustomCardShimmer(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0225,
          ),
          CustomCardShimmer(
            height: 200,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0225,
          ),
          CustomCardShimmer(
            height: 200,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0225,
          ),
          CustomCardShimmer(
            height: 200,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.0225,
          ),
        ],
      ),
    );
  }
}
